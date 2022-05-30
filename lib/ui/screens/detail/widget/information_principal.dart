import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/core/dependencies/database_provider.dart';
import 'package:rick_and_morty/core/entities/character.dart';
import 'package:rick_and_morty/ui/screens/home/home_status.dart';
import 'package:rick_and_morty/ui/utils/constants/constants.dart';
import 'package:rick_and_morty/ui/utils/responsive.dart';
import 'package:rick_and_morty/ui/widgets/ram_brackground.dart';
import 'package:rick_and_morty/ui/widgets/ram_star.dart';
import 'package:rick_and_morty/ui/widgets/ram_text.dart';

class InformationPrincipal extends ConsumerWidget {
  const InformationPrincipal({
    Key? key,
    required this.responsive,
    required this.character,
  }) : super(key: key);

  final Responsive responsive;
  final Character character;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            RamBackground(
              height: kDimens200,
              width: responsive.width,
              fit: BoxFit.cover,
              opacity: 0.8,
              image: kImagesBackgroundDetail,
            ),
            Container(
              decoration: const BoxDecoration(color: kBlueDark),
              height: kDimens200,
            )
          ],
        ),
        Positioned(
            left: kDimens20,
            top: kDimens30,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back,
                size: kDimens40,
                color: kWhite100,
              ),
            )),
        Positioned(
          top: kDimens125,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kDimens70),
                    border: Border.all(width: kDimens4, color: kWhite100)),
                height: kDimens140,
                width: kDimens140,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kDimens70),
                  child: FadeInImage.assetNetwork(
                    placeholder: kImagesLoadImage,
                    image: character.image,
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, url, error) => const Center(
                      child: CircularProgressIndicator(
                        color: kBlueDark,
                        backgroundColor: kWhite100,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: kDimens15,
              ),
              Row(
                children: [
                  Icon(
                    Icons.circle_rounded,
                    size: kDimens8,
                    color: managerColor(character.status),
                  ),
                  RamText(
                    colorText: kWhite100,
                    data: " ${character.status.toUpperCase()}",
                    fontSize: kDimens14,
                    fontWeight: FontWeight.w300,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              const SizedBox(
                height: kDimens15,
              ),
              RamText(
                colorText: kWhite100,
                data: " ${character.name}",
                fontSize: kDimens18,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: kDimens15,
              ),
              RamText(
                colorText: kWhite100,
                data: " ${character.species.toUpperCase()}",
                fontSize: kDimens14,
                fontWeight: FontWeight.w300,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        Positioned(
          top: kDimens240,
          child: GestureDetector(
            onTap: () async {
              ref.read(favoritesCharactersProvider.notifier).update((state) {
                if(state.contains(character)){
                  ref.watch(databaseProvider).characters().delete(character: character.toDb());
                  state.remove(character);
                  state = [...state];
                } else {
                  ref.watch(databaseProvider).characters().add(character: character.toDb());
                  state = [...state, character];
                }
                return state;
              });
            },
            child: RamStar(
              color: kWhite100,
              validate: ref.watch(favoritesCharactersProvider).contains(character),
            ),
          ),
        )
      ],
    );
  }
}
