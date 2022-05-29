import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RamText extends StatelessWidget {
  final Color colorText;
  final String data;
  final double fontSize;
  final double? height;
  final FontWeight fontWeight;
  final double? letterSpacing;
  final int? maxLines;
  final TextAlign? textAlign;
  final double? wordSpacing;

  const RamText({
    Key? key,
    required this.colorText,
    required this.data,
    required this.fontSize,
    required this.fontWeight,
    this.height,
    this.letterSpacing,
    this.maxLines,
    this.textAlign,
    this.wordSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      maxLines: maxLines,
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: colorText,
          fontWeight: fontWeight,
          fontSize: fontSize,
          height: height,
          letterSpacing: letterSpacing,
          overflow: TextOverflow.ellipsis,
          wordSpacing: wordSpacing,
        ),
      ),
      textAlign: textAlign,
    );
  }
}
