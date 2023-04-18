import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Acknowledgement extends StatefulWidget {
  const Acknowledgement({Key? key}) : super(key: key);

  @override
  State<Acknowledgement> createState() => _AcknowledgementState();
}

class _AcknowledgementState extends State<Acknowledgement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 16.h,
              ),
              Text('first cotton',
                  style: GoogleFonts.nunito(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    color: const Color(0xff27AE60),
                  )),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Dear User,\nWe wil contact you\nshortly to continue\nyour registration.",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.sp,
                    color: Colors.black),
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                "*May take upto 24 hrs.",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 10.sp,
                    color: Colors.black),
              )
            ],
          ),
        ),
      )),
    );
  }
}
