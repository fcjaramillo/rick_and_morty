import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/cubit/ram_cubit.dart';
import 'package:rick_and_morty/generated/l10n.dart';
import 'package:rick_and_morty/ui/screens/home/home_screen.dart';
import 'package:rick_and_morty/ui/utils/constants/constants.dart';
import 'package:rick_and_morty/ui/utils/responsive.dart';
import 'package:rick_and_morty/ui/widgets/ram_brackground.dart';
import 'package:rick_and_morty/ui/widgets/ram_image.dart';
import 'package:rick_and_morty/ui/widgets/ram_text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
      body: SizedBox(
        height: responsive.height,
        width: responsive.width,
        child: Stack(
          children: [
            RamBackground(
              height: responsive.height,
              image: kImagesBackgroundSmall,
              opacity: kDimens015,
              width: responsive.width,
            ),
            Positioned(
              left: kDimens0,
              right: kDimens0,
              top: responsive.hp(kDimens12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const RamImage(
                    image: kImagesLogo,
                    height: kDimens50,
                    width: kDimens200,
                  ),
                  const RamImage(
                    image: kImagesRamLogo,
                    height: kDimens200,
                    width: kDimens250,
                  ),
                  const SizedBox(
                    height: kDimens8,
                  ),
                  RamText(
                    data: I18n.of(context).sWelcomeTitle,
                    colorText: kWhite100,
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: kDimens12,
                  ),
                  RamText(
                    data: I18n.of(context).sWelcomeMessage,
                    colorText: kWhite100,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    textAlign: TextAlign.center,
                    letterSpacing: 1,
                    height: 1.3,
                    maxLines: 5,
                  ),
                  SizedBox(
                    height: responsive.hp(kDimens20),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<RamCubit>().getAllCharacter(null);
                      Navigator.push(context, HomeScreen.goto());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: kGreenBlue,
                          borderRadius: BorderRadius.circular(kDimens50)),
                      height: kDimens50,
                      width: kDimens130,
                      child: Center(
                        child: RamText(
                          data: I18n.of(context).sWelcomeContinue,
                          fontSize: 18,
                          colorText: kWhite100,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
