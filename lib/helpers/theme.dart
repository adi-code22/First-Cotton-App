import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(

        //ColorsTheme
        primaryColor: const Color(0xff27AE60),
        primaryColorLight: const Color(0xffEFF6E4),
        shadowColor: const Color(0xff2D9CDB),

        //Scaffold Theme
        scaffoldBackgroundColor: const Color(0xFF0F2F2F2),

        //AppBar Theme
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),

        //IconTheme
        iconTheme: const IconThemeData(color: Color(0xff828282)),
        primaryIconTheme: const IconThemeData(color: Color(0xff828282)),

        //textTheme
        textTheme: TextTheme(
          titleMedium: GoogleFonts.inter(),
          titleSmall: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp),
          headlineMedium: TextStyle(
              color: Color(0xff828282),
              fontWeight: FontWeight.bold,
              fontSize: 16.sp),
          headlineLarge:
              GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16.sp),
          headlineSmall: GoogleFonts.inter(
              fontSize: 10.sp, color: const Color(0xff828282)),
          bodySmall: TextStyle(color: const Color(0xff828282), fontSize: 14.sp),
          bodyMedium: TextStyle(
            color: Color(0xff828282),
            fontSize: 12.sp,
          ),
        ),
        // primaryTextTheme:
        //     const TextTheme(titleMedium: TextStyle(color: Colors.black)),

        //ButtonTheme
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: const Color(0xffCBC3E3),
        ));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        // primaryColor: Colors.grey,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Montserrat',
        textTheme: ThemeData.dark().textTheme,
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: const Color(0xffCC99FF),
        ));
  }
}
