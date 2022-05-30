import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui/utils/constants/constants.dart';

class RamStar extends StatefulWidget {
  const RamStar({Key? key, required this.validate, this.color})
      : super(key: key);

  final bool validate;
  final Color? color;

  @override
  State<RamStar> createState() => _RamStarState();
}

class _RamStarState extends State<RamStar> {
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
