import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

Widget titleRow(String title, String trailing, Color trailingColor) {
  var format =
      NumberFormat.currency(locale: 'en_IN', decimalDigits: 0, symbol: "₹");

  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
            fontSize: 12.sp,
            color: const Color(0xff828282),
            fontWeight: FontWeight.normal),
      ),
      Text(
        double.tryParse(trailing) != null
            ? format.format(double.parse(trailing))
            : trailing,
        style: TextStyle(
            fontSize: 14.sp,
            color: trailingColor,
            fontWeight: FontWeight.normal),
      ),
    ],
  );
}
