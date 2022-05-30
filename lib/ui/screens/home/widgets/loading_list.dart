import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui/utils/constants/constants.dart';
import 'package:rick_and_morty/ui/utils/responsive.dart';
import 'package:shimmer/shimmer.dart';

class LoadingList extends StatelessWidget {
  final int? count;

  const LoadingList({
    this.count,
    Key? key,
    required this.responsive,
  }) : super(key: key);

  final Responsive responsive;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDimens8,
              vertical: kDimens12,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kDimens10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kDimens10),
                  border: Border.all(color: kBlack30),
                ),
                height: kDimens155,
                width: responsive.width,
                child: Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: kWhite50,
                      highlightColor: kGray.withOpacity(0.3),
                      child: Container(
                        width: responsive.wp(kDimens37),
                        color: kBlueDark,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kDimens10,
                        vertical: kDimens15,
                      ),
                      child: SizedBox(
                        width: responsive.wp(kDimens50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            ShimmerComponent(
                              height: kDimens15,
                              width: kDimens100,
                            ),
                            SizedBox(height: kDimens2),
                            ShimmerComponent(
                              height: kDimens15,
                              width: kDimens100,
                            ),
                            SizedBox(height: kDimens10),
                            ShimmerComponent(
                              height: kDimens15,
                              width: kDimens110,
                            ),
                            SizedBox(height: kDimens2),
                            ShimmerComponent(
                              height: kDimens15,
                              width: kDimens80,
                            ),
                            SizedBox(height: kDimens10),
                            ShimmerComponent(
                              height: kDimens15,
                              width: kDimens80,
                            ),
                            SizedBox(height: kDimens2),
                            ShimmerComponent(
                              height: kDimens15,
                              width: kDimens140,
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
        },
        childCount: count ?? kDimens10.toInt(),
      ),
    );
  }
}

class ShimmerComponent extends StatelessWidget {
  final double height;
  final double width;

  const ShimmerComponent({
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: kWhite50,
      highlightColor: kGray.withOpacity(0.3),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kDimens10),
          color: kWhite100,
        ),
        height: height,
        width: width,
      ),
    );
  }
}
