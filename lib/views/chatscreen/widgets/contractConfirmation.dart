import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class contractConfirmation extends StatelessWidget {
  const contractConfirmation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Contract 44332',
                  style: GoogleFonts.inter(
                      fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Lot",
              style: GoogleFonts.inter(
                  fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              "24156-SSV-Mills-100Bales",
              style: GoogleFonts.inter(
                fontSize: 15.sp,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Price/candy",
              style: GoogleFonts.inter(
                  fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              "Rs 85,900",
              style: GoogleFonts.inter(
                fontSize: 15.sp,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Terms",
              style: GoogleFonts.inter(
                  fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              "15 Days",
              style: GoogleFonts.inter(
                fontSize: 15.sp,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "DECLINE",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Color(0xFFEB5757),
                      ),
                      height: 8.h,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "ACCEPT",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Color(0xFF27AE60),
                            border:
                                Border.all(color: Colors.green, width: 1.sp)),
                        height: 8.h,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
