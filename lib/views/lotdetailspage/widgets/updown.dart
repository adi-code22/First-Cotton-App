import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class updown extends StatelessWidget {
  const updown({
    Key? key,
    required String varr,
    required String val,
  })  : _var = varr,
        _val = val,
        super(key: key);

  final String _var;
  final String _val;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 23.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _var,
            style: GoogleFonts.inter(fontSize: 12.sp, color: Colors.grey),
          ),
          Text(
            _val,
            style:
                GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
