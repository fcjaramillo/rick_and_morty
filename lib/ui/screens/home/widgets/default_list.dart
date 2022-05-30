import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/entities/character.dart';
import 'package:rick_and_morty/ui/utils/constants/constants.dart';
import 'package:rick_and_morty/ui/utils/responsive.dart';
import 'package:rick_and_morty/ui/widgets/ram_text.dart';

class DefaultList extends StatelessWidget {
  const DefaultList({
    Key? key,
    required this.responsive,
    required this.list,
  }) : super(key: key);

  final Responsive responsive;
  final List<Character> list;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: kBlack30,
              ),
            ),
            height: 170,
            width: responsive.width,
            child: Row(
              children: [
                SizedBox(
                  height: kDimens170,
                  width: responsive.wp(kDimens37),
                  child: FadeInImage.assetNetwork(
                    placeholder: kImagesLoadImage,
                    image: list[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: SizedBox(
                    width: responsive.wp(50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.circle_rounded,
                              size: 8,
                              color: managerColor(list[index].status),
                            ),
                            RamText(
                                colorText: kBlack100,
                                data:
                                    " ${list[index].status} - ${list[index].species}",
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                textAlign: TextAlign.left),
                          ],
                        ),
                        RamText(
                            colorText: kBlack100,
                            data: " ${list[index].name}",
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.left),
                        const SizedBox(height: 8),
                        const RamText(
                            colorText: kBlack100,
                            data: "Last know location:",
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            textAlign: TextAlign.left,
                        ),
                        Expanded(
                          child: RamText(
                            colorText: kBlack100,
                            data: list[index].location,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.left,
                            maxLines: 2,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const RamText(
                            colorText: kBlack100,
                            data: "First seen in:",
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            textAlign: TextAlign.left,
                        ),
                        Expanded(
                          child: RamText(
                            colorText: kBlack100,
                            data: list[index].firstEpisode.name.isEmpty
                                ? "Not available"
                                : list[index].firstEpisode.name,
                            fontSize: 14,
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
      );
    }, childCount: list.length));
  }
}
