import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/core/dependencies/database_provider.dart';
import 'package:rick_and_morty/generated/l10n.dart';
import 'package:rick_and_morty/ui/screens/home/home_status.dart';
import 'package:rick_and_morty/ui/utils/constants/constants.dart';
import 'package:rick_and_morty/ui/utils/responsive.dart';
import 'package:rick_and_morty/ui/widgets/ram_buttom.dart';
import 'package:rick_and_morty/ui/widgets/ram_star.dart';
import 'package:rick_and_morty/ui/widgets/ram_text.dart';

class FavoriteList extends ConsumerStatefulWidget {
  const FavoriteList({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<FavoriteList> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteList> {
  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    final list = ref.watch(favoritesCharactersProvider);
    if (list.isNotEmpty) {
      return SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onTap: () {
              /*List allEpisodes = allEpisode(list[index].episodes);
            context
                .read<EpisodeCubit>()
                .getEpisodeForCharacter(episodes: allEpisodes);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Detail(
                          charaterModels: list[index],
                        )));*/
            },
            child: Padding(
              padding: const EdgeInsets.all(kDimens8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kDimens10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kDimens10),
                      border: Border.all(color: kBlack100.withOpacity(0.3))),
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
                                  image: list[index].image,
                                  fit: BoxFit.cover,
                                  imageErrorBuilder: (context, url, error) =>
                                      const Center(
                                    child: CircularProgressIndicator(
                                      color: kBlueDark,
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
                                      if(state.contains(list[index])){
                                        ref.watch(databaseProvider).characters().delete(character: list[index].toDb());
                                        state.remove(list[index]);
                                        state = [...state];
                                      } else {
                                        ref.watch(databaseProvider).characters().add(character: list[index].toDb());
                                        state = [...state, list[index]];
                                      }
                                      return state;
                                    });
                                  },
                                  child: RamStar(
                                    color: kWhite100,
                                    validate: ref
                                        .watch(favoritesCharactersProvider)
                                        .contains(list[index]),
                                  ),
                                ),
                              ),
                            ],
                          )),
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
                                    color: managerColor(list[index].status),
                                  ),
                                  RamText(
                                      colorText: kBlack100,
                                      data:
                                          " ${list[index].status} - ${list[index].species}",
                                      fontSize: kDimens12,
                                      fontWeight: FontWeight.w300,
                                      textAlign: TextAlign.left),
                                ],
                              ),
                              RamText(
                                  colorText: kBlack100,
                                  data: " ${list[index].name}",
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
                                  data: list[index].location,
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
                                  textAlign: TextAlign.left),
                              Expanded(
                                child: RamText(
                                  colorText: kBlack100,
                                  data: list[index].firstEpisode.name.isEmpty
                                      ? I18n.of(context).sHomeNotAvailable
                                      : list[index].firstEpisode.name,
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
        },
        childCount: list.length,
      ));
    } else {
      return SliverToBoxAdapter(
        child: Column(
          children: [
            const RamText(
              colorText: kBlack100,
              data: "Uh-oh!",
              fontSize: 30,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: kDimens10,
            ),
            RamText(
              colorText: kBlack80,
              data: I18n.of(context).wFavoriteLost,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: () {
                ref
                    .watch(isFavoriteAllProvider.notifier)
                    .update((state) => !state);
              },
              child: RamBottom(
                responsive: responsive,
                left: responsive.wp(20),
                right: responsive.wp(20),
                text: I18n.of(context).wFavoriteRemoveFilters,
              ),
            )
          ],
        ),
      );
    }
  }
}
