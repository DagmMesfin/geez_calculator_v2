import 'package:flutter/material.dart';

Widget CalButton(
    String text, Color textcol, Color bgcol, String fontfam, Function() onTap,
    {double fontsize = 25}) {
  return Container(
    height: 60,
    decoration:
        BoxDecoration(color: bgcol, borderRadius: BorderRadius.circular(23)),
    margin: EdgeInsets.symmetric(horizontal: 3.5, vertical: 6),
    child: TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style:
            TextStyle(fontSize: fontsize, color: textcol, fontFamily: fontfam),
      ),
    ),
  );
}
