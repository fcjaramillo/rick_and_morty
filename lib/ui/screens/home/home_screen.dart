import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/core/cubit/ram_cubit.dart';
import 'package:rick_and_morty/core/dependencies/database_provider.dart';
import 'package:rick_and_morty/core/entities/character.dart';
import 'package:rick_and_morty/generated/l10n.dart';
import 'package:rick_and_morty/ui/screens/home/widgets/favorite_list.dart';
import 'package:rick_and_morty/ui/screens/home/home_status.dart';
import 'package:rick_and_morty/ui/screens/home/widgets/default_list.dart';
import 'package:rick_and_morty/ui/screens/home/widgets/loading_list.dart';
import 'package:rick_and_morty/ui/utils/constants/constants.dart';
import 'package:rick_and_morty/ui/utils/responsive.dart';
import 'package:rick_and_morty/ui/widgets/ram_brackground.dart';
import 'package:rick_and_morty/ui/widgets/ram_buttom.dart';
import 'package:rick_and_morty/ui/widgets/ram_image.dart';
import 'package:rick_and_morty/ui/widgets/ram_star.dart';
import 'package:rick_and_morty/ui/widgets/ram_text.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Route goto() => MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      kDimens8,
    ),
    borderSide: const BorderSide(
      color: kWhite100,
      width: kDimens2,
    ),
  );
  ScrollController scrollController = ScrollController();
  TextEditingController textController = TextEditingController();
  bool favorite = false;

  @override
  void initState() {
    final buss = context.read<RamCubit>();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          (scrollController.position.maxScrollExtent - 1000)) {
        BlocListener<RamCubit, RamState>(listener: ((context, state) {
          if (state.runtimeType == RamLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 5),
                content: RamText(
                  data: I18n.of(context).sHomeLoadData,
                  fontSize: kDimens14,
                  colorText: kWhite100,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                ),
                backgroundColor: kBlueDark,
              ),
            );
          }
        }));

        if (textController.text.isNotEmpty) {
          if (buss.pages >= buss.pageSearch) {
            buss.getCharacterWithFilters(
              name: textController.text,
              clearData: false,
            );
          }
        } else if (buss.isFilter) {
          if (buss.pages >= buss.pageFilter) {
            buss.getCharacterWithFilters(
              clearData: false,
            );
          }
        } else {
          if (buss.pages >= buss.page) {
            buss.getAllCharacter(null);
          }
        }
      }
    });

    Future.delayed(Duration.zero, () async {
      final cFavorites = await ref.watch(databaseProvider).characters().get();

      ref.read(favoritesCharactersProvider.notifier).update((state) {
        final fav = cFavorites.map((f) => f.toEntity()).toList();
        return [...state, ...fav];
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          _AppBar(responsive: responsive),
          SliverToBoxAdapter(
            child: Container(
              color: kBlueDark,
              height: kDimens90,
              width: responsive.width,
              child: Padding(
                padding: const EdgeInsets.all(kDimens20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: responsive.wp(kDimens70),
                      child: TextFormField(
                        controller: textController,
                        cursorColor: kWhite100,
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(color: kWhite100)),
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search,
                              color: kWhite100,
                            ),
                            hintText: I18n.of(context).sHomeSearch,
                            hintStyle: GoogleFonts.montserrat(
                                textStyle: const TextStyle(color: kWhite100)),
                            border: border,
                            focusedBorder: border,
                            enabledBorder: border),
                        onChanged: (v) {
                          if (v.isNotEmpty) {
                            Future.delayed(const Duration(milliseconds: 1000),
                                () {
                              context.read<RamCubit>().getCharacterWithFilters(
                                    page: '1',
                                    name: v,
                                    clearData: true,
                                  );
                            });
                          } else {
                            context.read<RamCubit>().clearData();
                            context.read<RamCubit>().getAllCharacter(null);
                          }
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        ref
                            .read(filterVisibleProvider.notifier)
                            .update((state) => !state);
                      },
                      icon: Icon(
                        ref.watch(filterVisibleProvider)
                            ? Icons.close
                            : Icons.menu,
                        color: kWhite100,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Visibility(
              visible: ref.watch(filterVisibleProvider),
              child: Filter(
                responsive: responsive,
                context: context,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: kDimens30, horizontal: kDimens20),
              child: Row(
                children: [
                  RamText(
                    colorText: kBlack100,
                    data: I18n.of(context).sHomeShowFavorites,
                    fontSize: kDimens18,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    width: kDimens8,
                  ),
                  GestureDetector(
                    onTap: () {
                      ref
                          .read(isFavoriteAllProvider.notifier)
                          .update((state) => !state);
                    },
                    child: RamStar(
                      validate: ref.watch(isFavoriteAllProvider),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (!ref.watch(isFavoriteAllProvider))
            BlocBuilder<RamCubit, RamState>(
              builder: ((context, state) {
                switch (state.runtimeType) {
                  case RamLoading:
                    return LoadingList(responsive: responsive);
                  case RamLoaded:
                    List<Character> list = state.props[0] as List<Character>;
                    return SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                      return GestureDetector(
                        onTap: () {
                          Random rng = Random();
                          List<Character> random = [];
                          random.add(list[rng.nextInt(list.length - 1)]);
                          random.add(list[rng.nextInt(list.length - 1)]);
                          List allEpisodes = allEpisode(list[index].episodes);
                          /*context
                            .read<EpisodeCubit>()
                            .getEpisodeForCharacter(episodes: allEpisodes);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Detail(
                                    charaterModels: list[index],
                                    charaterInterest: random)));*/
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(kDimens8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(kDimens10),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(kDimens10),
                                  border: Border.all(
                                      color: kBlack100.withOpacity(0.3))),
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
                                            imageErrorBuilder:
                                                (context, url, error) => const Center(
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
                                                  state.remove(list[index]);
                                                  ref.watch(databaseProvider).characters().delete(character: list[index].toDb());
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
                                              validate: ref.watch(favoritesCharactersProvider).contains(list[index]),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: kDimens10,
                                        vertical: kDimens10),
                                    child: SizedBox(
                                      width: responsive.wp(kDimens50),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.circle_rounded,
                                                size: kDimens8,
                                                color: managerColor(
                                                    list[index].status),
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
                                              data: I18n.of(context)
                                                  .sHomeLastLocation,
                                              fontSize: kDimens12,
                                              fontWeight: FontWeight.w300,
                                              textAlign: TextAlign.left),
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
                                              data: I18n.of(context)
                                                  .sHomeFirstSeen,
                                              fontSize: kDimens12,
                                              fontWeight: FontWeight.w300,
                                              textAlign: TextAlign.left),
                                          Expanded(
                                            child: RamText(
                                              colorText: kBlack100,
                                              data: list[index]
                                                      .firstEpisode
                                                      .name
                                                      .isEmpty
                                                  ? I18n.of(context)
                                                      .sHomeNotAvailable
                                                  : list[index]
                                                      .firstEpisode
                                                      .name,
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
                    }, childCount: list.length));
                  case RamError:
                    return SliverToBoxAdapter(
                      child: Center(
                        child: RamText(
                          colorText: kGrayDetail,
                          data: I18n.of(context).errorData,
                          fontSize: kDimens14,
                          fontWeight: FontWeight.w600,
                          maxLines: 2,
                        ),
                      ),
                    );
                  case RamWithOutConnexion:
                    return SliverToBoxAdapter(
                      child: Center(
                        child: RamText(
                          colorText: kGrayDetail,
                          data: I18n.of(context).errorInternet,
                          fontSize: kDimens14,
                          fontWeight: FontWeight.w600,
                          maxLines: 2,
                        ),
                      ),
                    );

                  default:
                    List<Character> list = context.read<RamCubit>().characters;
                    return list.isNotEmpty
                        ? DefaultList(responsive: responsive, list: list)
                        : LoadingList(responsive: responsive);
                }
              }),
            ),
          if (ref.watch(isFavoriteAllProvider)) const FavoriteList(),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key? key,
    required this.responsive,
  }) : super(key: key);

  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        alignment: Alignment.center,
        children: [
          RamBackground(
            height: responsive.hp(kDimens28),
            width: responsive.width,
            fit: BoxFit.cover,
            opacity: 0.3,
            image: kImagesBackgroundSmall,
          ),
          const RamImage(
            image: kImagesRamLogo,
            height: kDimens200,
            width: kDimens250,
          ),
        ],
      ),
    );
  }
}

class Filter extends ConsumerStatefulWidget {
  final BuildContext context;
  final Responsive responsive;

  const Filter({Key? key, required this.responsive, required this.context})
      : super(key: key);

  @override
  ConsumerState<Filter> createState() => _FilterState();
}

class _FilterState extends ConsumerState<Filter> {
  int primaryIndex = 0;
  List<String> listGender = ["all", "unknown", "female", "male", "genderless"];
  int secondaryIndex = 0;
  List<String> listStatus = ["all", "alive", "unknown", "dead"];
  String gender = "All";
  String status = "All";

  @override
  Widget build(BuildContext context) {
    primaryIndex = ref.watch(primaryIndexProvider);
    secondaryIndex = ref.watch(secondaryIndexProvider);
    return Container(
      decoration: const BoxDecoration(
        color: kWhite100,
        borderRadius: BorderRadius.all(Radius.circular(kDimens10)),
      ),
      height: kDimens270,
      width: widget.responsive.width,
      child: Padding(
        padding: const EdgeInsets.all(kDimens8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    RamText(
                      colorText: kGreenBlue,
                      data: I18n.of(context).wFilterGender,
                      fontSize: kDimens14,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: kDimens140,
                      width: widget.responsive.wp(kDimens35),
                      child: ListView.builder(
                        padding:
                            const EdgeInsets.symmetric(vertical: kDimens10),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: listGender.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                ref.read(primaryIndexProvider.notifier).state =
                                    index;
                                gender = listGender[index];
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: kDimens5),
                              child: RamText(
                                colorText: primaryIndex == index
                                    ? kBlack100
                                    : kGreenBlue,
                                data: I18n.of(context)
                                    .wFilterGenderValues(listGender[index]),
                                fontSize: kDimens14,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    RamText(
                      colorText: kGreenBlue,
                      data: I18n.of(context).wFilterStatus,
                      fontSize: kDimens14,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: kDimens140,
                      width: widget.responsive.wp(kDimens35),
                      child: ListView.builder(
                        padding:
                            const EdgeInsets.symmetric(vertical: kDimens10),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: listStatus.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                ref
                                    .read(secondaryIndexProvider.notifier)
                                    .state = index;
                                status = listStatus[index];
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(kDimens8),
                              child: RamText(
                                colorText: secondaryIndex == index
                                    ? managerColor(listStatus[index])
                                    : kGreenBlue,
                                data: I18n.of(context)
                                    .wFilterStatusValues(listStatus[index]),
                                fontSize: kDimens14,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                context.read<RamCubit>()
                  ..getCharacterWithFilters(
                    gender: gender,
                    status: status,
                    clearData: true,
                  )
                  ..changeFilters(gender: gender, status: status)
                  ..changeIsFilter(true);
              },
              child: RamBottom(
                responsive: widget.responsive,
                left: widget.responsive.wp(kDimens20),
                right: widget.responsive.wp(kDimens20),
                text: I18n.of(context).wFilterSearch,
                widht: kDimens120,
                height: kDimens40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
