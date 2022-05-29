import 'package:flutter/material.dart';

class RamImage extends StatelessWidget {
  final double height;
  final String image;
  final double width;

  const RamImage({
    Key? key,
    required this.height,
    required this.image,
    required this.width,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
        ),
      ),
      height: height,
      width: width,
    );
  }
}
