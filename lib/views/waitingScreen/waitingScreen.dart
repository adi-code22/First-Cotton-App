import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const SizedBox(height: 160,),

                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'first cotton',
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      color: const Color(0xff27AE60),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Dear User,\nWe will contact you  shortly to register your  account with us.',maxLines: 4,
                  style: TextStyle(fontSize: 24.sp),
                ),
                const SizedBox(height: 40,),

                Text('*May take upto 24 hrs' ,style: TextStyle(fontSize: 14.sp),)
              ],

            ),
          ),
        ),
      ),
    );
  }
}
