import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui/utils/constants/constants.dart';


class RamBackground extends StatelessWidget {
  final BoxFit? fit;
  final double height;
  final String image;
  final double? opacity;
  final double width;

  const RamBackground({
    this.fit,
    required this.height,
    required this.image,
    this.opacity,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: kBlack100),
      height: height,
      width: width,
      child: Opacity(
        opacity: opacity ?? kDimens1,
        child: Image(
          image: AssetImage(image),
          fit: fit,
        ),
      ),
    );
  }
}
