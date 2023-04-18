import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

Column myProfileTab(String label, String userName, [Color? clr]) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 3.h,
      ),
      Text(
        label,
        style: TextStyle(fontSize: 12.sp),
      ),
      SizedBox(
        height: 1.h,
      ),
      Text(
        userName,
        style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: clr ?? const Color.fromRGBO(51, 51, 51, 1)),
      ),
    ],
  );
}
