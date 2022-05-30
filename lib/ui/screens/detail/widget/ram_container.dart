import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/entities/character.dart';
import 'package:rick_and_morty/ui/utils/constants/constants.dart';
import 'package:rick_and_morty/ui/utils/responsive.dart';
import 'package:rick_and_morty/ui/widgets/ram_text.dart';

class RamContainer extends StatelessWidget {
  const RamContainer({
    Key? key,
    required this.responsive,
    required this.character,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final Responsive responsive;
  final Character character;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: kDimens1, color: kGrayDetail)),
      height: kDimens60,
      width: responsive.wp(kDimens42),
      child: Padding(
        padding: const EdgeInsets.only(top: kDimens10, left: kDimens20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.info,
                  size: kDimens20,
                ),
                const SizedBox(
                  width: kDimens5,
                ),
                RamText(
                  colorText: kBlack100,
                  data: title,
                  fontSize: kDimens12,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            RamText(
              colorText: kBlack100,
              data: subtitle,
              fontSize: kDimens16,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.left,
            )
          ],
        ),
      ),
    );
  }
}
