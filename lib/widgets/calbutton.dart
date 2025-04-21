import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget CalButton(
    String text, Color textcol, Color bgcol, String fontfam, Function() onTap,
    {double fontsize = 25}) {
  return Container(
    height: 60.h,
    decoration:
        BoxDecoration(color: bgcol, borderRadius: BorderRadius.circular(23.r)),
    margin: EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 6.h),
    child: TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontsize.sp, color: textcol, fontFamily: fontfam),
      ),
    ),
  );
}

Widget ActButton(String text, Color textcol, Color bgcol, String fontfam,
    bool showGeezResult, Function() onTap,
    {double fontsize = 25}) {
  return Container(
    height: 60.h,
    decoration:
        BoxDecoration(color: bgcol, borderRadius: BorderRadius.circular(23.r)),
    margin: EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 6.h),
    child: IconButton(
      onPressed: onTap,
      icon: Icon(
        showGeezResult ? Icons.numbers : Icons.translate,
        size: fontsize.sp,
        color: textcol,
      ),
    ),
  );
}
