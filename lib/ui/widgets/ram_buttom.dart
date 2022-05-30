import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui/utils/constants/constants.dart';
import 'package:rick_and_morty/ui/utils/responsive.dart';
import 'package:rick_and_morty/ui/widgets/ram_text.dart';

class RamBottom extends StatefulWidget {
  const RamBottom(
      {Key? key,
      required this.responsive,
      required this.left,
      required this.right,
      required this.text,
      this.top,
      this.height,
      this.widht,
      this.callback})
      : super(key: key);

  final Responsive responsive;
  final String text;
  final double left;
  final double right;
  final double? top;
  final double? height;
  final double? widht;
  final VoidCallback? callback;

  @override
  State<RamBottom> createState() => _RamBottomState();
}

class _RamBottomState extends State<RamBottom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: widget.top ?? kDimens50,
        left: widget.left,
        right: widget.right,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: kGreenBlue,
          borderRadius: BorderRadius.circular(kDimens50),
        ),
        height: widget.height ?? kDimens50,
        width: widget.widht ?? widget.responsive.wp(kDimens80),
        child: Center(
          child: RamText(
            colorText: kWhite100,
            data: widget.text,
            fontSize: kDimens18,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
