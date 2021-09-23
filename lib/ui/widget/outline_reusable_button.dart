
import 'package:flutter/material.dart';

class OutlineReusableButton extends StatelessWidget {
  final String name;
  final Color color;
  final Function onPressed;
  final double fontSize;
  final Color fontColor;
  final double horizontal;
  final double minHeight;
  final double minWidth;
  final double border;
  final String fontFamily;
  final Color backgroundColor;
  OutlineReusableButton({
    @required this.name,
    @required this.color,
    @required this.onPressed,
    @required this.fontColor,
    @required this.fontSize,
    @required this.horizontal,
    @required this.minHeight,
    @required this.minWidth,
    this.backgroundColor,
    this.border,
    this.fontFamily,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        backgroundColor: backgroundColor ?? Colors.white,
        minimumSize: Size(minWidth, minHeight),
        side: BorderSide(
          width: 1.5,
          color: color,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(border ?? 10.0),
          ),
        ),
      ),
      child: Text(
        name,
        style: TextStyle(
            fontSize: fontSize,
            color: fontColor),
      ),
    );
  }
}
