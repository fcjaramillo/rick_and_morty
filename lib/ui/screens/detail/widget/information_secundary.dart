import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/entities/character.dart';
import 'package:rick_and_morty/generated/l10n.dart';
import 'package:rick_and_morty/ui/screens/detail/widget/ram_container.dart';
import 'package:rick_and_morty/ui/utils/constants/constants.dart';
import 'package:rick_and_morty/ui/utils/responsive.dart';
import 'package:rick_and_morty/ui/widgets/ram_text.dart';

class InformationSecondary extends StatelessWidget {
  const InformationSecondary({
    Key? key,
    required this.responsive,
    required this.character,
  }) : super(key: key);

  final Responsive responsive;
  final Character character;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kDimens185,
      width: responsive.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RamText(
            colorText: kGrayDetail,
            data: I18n.of(context).wInfoInfo,
            fontSize: kDimens18,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: kDimens20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RamContainer(
                responsive: responsive,
                character: character,
                title: "${I18n.of(context).wInfoGender}:",
                subtitle: character.gender.toUpperCase(),
              ),
              RamContainer(
                responsive: responsive,
                character: character,
                title: "${I18n.of(context).wInfoOrigin}:",
                subtitle: character.origin,
              ),
            ],
          ),
          const SizedBox(
            height: kDimens20,
          ),
          RamContainer(
              responsive: responsive,
              character: character,
              title: "${I18n.of(context).wInfoType}:",
              subtitle: character.status,
          ),
        ],
      ),
    );
  }
}
