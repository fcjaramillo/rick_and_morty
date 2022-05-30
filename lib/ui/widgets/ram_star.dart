import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui/utils/constants/constants.dart';

class CustomStar extends StatefulWidget {
  const CustomStar({Key? key, required this.validate, this.color})
      : super(key: key);

  final bool validate;
  final Color? color;

  @override
  State<CustomStar> createState() => _CustomStarState();
}

class _CustomStarState extends State<CustomStar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kDimens50),
          color: widget.color ?? kGray.withOpacity(0.3)),
      height: kDimens36,
      width: kDimens36,
      child: Icon(
        Icons.star,
        color: widget.validate == false ? kGrayDetail : kYellow,
      ),
    );
  }
}
