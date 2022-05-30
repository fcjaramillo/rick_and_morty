import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/core/cubit/episode_cubit.dart';
import 'package:rick_and_morty/core/dependencies/database_provider.dart';
import 'package:rick_and_morty/core/entities/character.dart';
import 'package:rick_and_morty/core/entities/episode.dart';
import 'package:rick_and_morty/generated/l10n.dart';
import 'package:rick_and_morty/ui/screens/detail/widget/information_principal.dart';
import 'package:rick_and_morty/ui/screens/detail/widget/information_secundary.dart';
import 'package:rick_and_morty/ui/screens/home/home_status.dart';
import 'package:rick_and_morty/ui/screens/home/widgets/loading_list.dart';
import 'package:rick_and_morty/ui/utils/constants/constants.dart';
import 'package:rick_and_morty/ui/utils/responsive.dart';
import 'package:rick_and_morty/ui/widgets/ram_buttom.dart';
import 'package:rick_and_morty/ui/widgets/ram_star.dart';
import 'package:rick_and_morty/ui/widgets/ram_text.dart';
import 'package:share_plus/share_plus.dart';

class DetailScreen extends ConsumerStatefulWidget {
  final List<Character>? characterInterest;
  final Character character;

  const DetailScreen({
    required this.character,
    this.characterInterest,
    Key? key,
  }) : super(key: key);

  static Route goto({
    List<Character>? characterInterest,
    required Character character,
  }) => MaterialPageRoute(
    builder: (_) => DetailScreen(
      character: character,
      characterInterest: characterInterest,
    ),
  );

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  bool more = false;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
      body: SizedBox(
        height: responsive.height,
        width: responsive.width,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: kDimens400,
                width: responsive.width,
                child: InformationPrincipal(
                    responsive: responsive, character: widget.character),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDimens20, vertical: kDimens50),
                child: InformationSecondary(
                  responsive: responsive,
                  character: widget.character,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: kDimens20, bottom: kDimens20),
                child: RamText(
                  colorText: kGrayDetail,
                  data: I18n.of(context).sDetailEpisode,
                  fontSize: kDimens18,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            BlocBuilder<EpisodeCubit, EpisodeState>(builder: ((context, state) {
              switch (state.runtimeType) {
                case EpisodeLoaded:
                  List<Episode> list = state.props[0] as List<Episode>;
                  return SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: index % 2 == 0 ? kDimens15 : kDimens10,
                            right: index % 2 == 0 ? kDimens10 : kDimens15,
                          ),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: kWhite100,
                                  border: Border.all(width: 1, color: kGray),
                                  borderRadius:
                                      BorderRadius.circular(kDimens10)),
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(kDimens12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RamText(
                                      colorText: kBlack100,
                                      data: list[index].name,
                                      fontSize: kDimens12,
                                      fontWeight: FontWeight.w300,
                                      textAlign: TextAlign.left,
                                    ),
                                    RamText(
                                      colorText: kBlack100,
                                      data: list[index].episode,
                                      fontSize: kDimens16,
                                      fontWeight: FontWeight.w600,
                                      textAlign: TextAlign.left,
                                    ),
                                    const SizedBox(
                                      height: kDimens10,
                                    ),
                                    RamText(
                                      colorText: kBlack100,
                                      data: list[index].date,
                                      fontSize: kDimens12,
                                      fontWeight: FontWeight.w300,
                                      textAlign: TextAlign.left,
                                    )
                                  ],
                                ),
                              )),
                        );
                      },
                      childCount: more == false
                          ? (list.length > 4 ? 4 : list.length)
                          : list.length,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 0,
                      childAspectRatio: 2.2,
                    ),
                  );
                case EpisodeLoading:
                  return LoadingList(
                    responsive: responsive,
                    count: 4,
                  );
                case EpisodeError:
                  return SliverToBoxAdapter(
                    child: RamText(
                      colorText: kGreenBlue,
                      data: I18n.of(context).sHomeNotAvailable,
                      fontSize: kDimens16,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                  );
                default:
                  return SliverToBoxAdapter(
                    child: Container(),
                  );
              }
            })),
            BlocBuilder<EpisodeCubit, EpisodeState>(builder: ((context, state) {
              switch (state.runtimeType) {
                case EpisodeLoaded:
                  return SliverToBoxAdapter(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          more = !more;
                        });
                      },
                      child: RamText(
                        colorText: kGreenBlue,
                        data: more == false
                            ? I18n.of(context).sDetailShowMore
                            : I18n.of(context).sDetailShowLess,
                        fontSize: kDimens16,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                default:
                  return const SliverToBoxAdapter();
              }
            })),
            if (widget.characterInterest != null &&
                widget.characterInterest!.isNotEmpty)
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return GestureDetector(
                  onTap: () {
                    List allEpisodes =
                        allEpisode(widget.characterInterest![index].episodes);
                    context
                        .read<EpisodeCubit>()
                        .getEpisodeForCharacter(episodes: allEpisodes);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          character: widget.characterInterest![index],
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(kDimens8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(kDimens10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kDimens10),
                          border: Border.all(
                            color: kBlack30,
                          ),
                        ),
                        height: kDimens170,
                        width: responsive.width,
                        child: Row(
                          children: [
                            SizedBox(
                              height: kDimens170,
                              width: responsive.wp(kDimens37),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: kDimens0,
                                    bottom: kDimens0,
                                    left: kDimens0,
                                    right: kDimens0,
                                    child: FadeInImage.assetNetwork(
                                      placeholder: kImagesLoadImage,
                                      image: widget.characterInterest![index].image,
                                      fit: BoxFit.cover,
                                      imageErrorBuilder: (context, url, error) =>
                                          const Center(
                                        child: CircularProgressIndicator(
                                          color: kGreenBlue,
                                          backgroundColor: kWhite100,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: kDimens10,
                                    right: kDimens10,
                                    child: GestureDetector(
                                      onTap: () async {
                                        ref.read(favoritesCharactersProvider.notifier).update((state) {
                                          if(state.contains(widget.characterInterest![index])){
                                            ref.watch(databaseProvider).characters().delete(character: widget.characterInterest![index].toDb());
                                            state.remove(widget.characterInterest![index]);
                                            state = [...state];
                                          } else {
                                            ref.watch(databaseProvider).characters().add(character: widget.characterInterest![index].toDb());
                                            state = [...state, widget.characterInterest![index]];
                                          }
                                          return state;
                                        });
                                      },
                                      child: RamStar(
                                        color: kWhite100,
                                        validate: ref
                                            .watch(favoritesCharactersProvider)
                                            .contains(widget.characterInterest![index]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDimens10, vertical: kDimens10),
                              child: SizedBox(
                                width: responsive.wp(kDimens50),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.circle_rounded,
                                          size: kDimens8,
                                          color: managerColor(widget
                                              .characterInterest![index]
                                              .status),
                                        ),
                                        RamText(
                                          colorText: kBlack100,
                                          data:
                                              "${widget.characterInterest![index].status} - ${widget.characterInterest![index].species}",
                                          fontSize: kDimens12,
                                          fontWeight: FontWeight.w300,
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                    RamText(
                                        colorText: kBlack100,
                                        data:
                                            " ${widget.characterInterest![index].name}",
                                        fontSize: kDimens16,
                                        fontWeight: FontWeight.w400,
                                        textAlign: TextAlign.left),
                                    const SizedBox(height: kDimens8),
                                    RamText(
                                      colorText: kBlack100,
                                      data: I18n.of(context).sHomeLastLocation,
                                      fontSize: kDimens12,
                                      fontWeight: FontWeight.w300,
                                      textAlign: TextAlign.left,
                                    ),
                                    Expanded(
                                      child: RamText(
                                        colorText: kBlack100,
                                        data: widget
                                            .characterInterest![index].location,
                                        fontSize: kDimens14,
                                        fontWeight: FontWeight.w400,
                                        textAlign: TextAlign.left,
                                        maxLines: 2,
                                      ),
                                    ),
                                    const SizedBox(height: kDimens10),
                                    RamText(
                                      colorText: kBlack100,
                                      data: I18n.of(context).sHomeFirstSeen,
                                      fontSize: kDimens12,
                                      fontWeight: FontWeight.w300,
                                      textAlign: TextAlign.left,
                                    ),
                                    Expanded(
                                      child: RamText(
                                        colorText: kBlack100,
                                        data: widget.characterInterest![index]
                                                .firstEpisode.name.isEmpty
                                            ? I18n.of(context).sHomeNotAvailable
                                            : widget.characterInterest![index]
                                                .firstEpisode.name,
                                        fontSize: kDimens14,
                                        fontWeight: FontWeight.w400,
                                        textAlign: TextAlign.left,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }, childCount: widget.characterInterest!.length)),
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: (){
                  print(widget.character.url);
                  print(widget.character);
                  Share.share(widget.character.url);
                },
                child: RamBottom(
                  responsive: responsive,
                  left: responsive.wp(kDimens15),
                  right: responsive.wp(kDimens15),
                  text: I18n.of(context).sDetailShareCharacter,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                    top: kDimens50,
                    left: responsive.wp(kDimens15),
                    right: responsive.wp(kDimens15)),
                child: SizedBox(
                  height: kDimens50,
                  width: responsive.wp(kDimens80),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
