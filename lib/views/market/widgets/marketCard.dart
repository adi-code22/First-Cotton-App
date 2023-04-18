import 'package:first_cotton/helpers/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

Padding marketCard(int index, BuildContext context, List items) {
  var format =
      NumberFormat.currency(locale: 'hi_IN', decimalDigits: 0, symbol: "₹");
  return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          height: 180,
          child: Column(
            children: [
              //cardHeading(index),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              items[index].entityName,
                              style: TextStyle(
                                  fontSize: 11.sp, fontWeight: FontWeight.bold),
                            ),
                          )),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              double.tryParse(
                                          items[index].askPrice.toString()) !=
                                      null
                                  ? format.format(num.parse(
                                      items[index].askPrice.toString()))
                                  : '-',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[index].station,
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              Text(
                                "Station",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[index].avgUhml.toString() + "mm",
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                "Staple",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 10.sp),
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[index].lotNumber.toString(),
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              Text(
                                "Bunny",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[index].avgMic.toString(),
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                "MIC",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 10.sp),
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[index].terms != null
                                    ? items[index].terms.toString() + " Days"
                                    : '-',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp),
                              ),
                              Text(
                                "Terms",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 10.sp),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[index].avgGtex.toString(),
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                "gTex",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 10.sp),
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[index].avgColorRd.toString(),
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                "Rd",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 10.sp),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
            ],
          ),
        ),
      ));
}
