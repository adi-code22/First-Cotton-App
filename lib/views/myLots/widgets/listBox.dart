import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

//listBox combines 2 text widgets in a col.
Widget listBox(String title, String subtitle) {
  return SizedBox(
    height: 36,
    // width: 50,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(fontSize: 14.sp),
        ),
        Text(
          subtitle,
          style: GoogleFonts.inter(color: Color(0xff828282), fontSize: 10),
        )
      ],
    ),
  );
}
