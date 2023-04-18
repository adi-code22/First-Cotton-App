import 'package:first_cotton/views/myLots/widgets/listBox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

SizedBox myLotsCard(
    Size size, int index, bool isSearching, List result, List myLots, int i) {
  return SizedBox(
    height: 112,
    width: size.width,
    child: Card(
      elevation: 3,
      // shadowColor:
      //     Color.fromRGBO(0, 0, 0, 0.10000000149011612),
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(children: [
                    i == 0
                        ? TextSpan(
                            text: isSearching
                                ? 'Lot ' + result[index].lotNumber.toString()
                                : 'Lot ' + myLots[index].lotNumber.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold))
                        : TextSpan(
                            text: "${myLots[index].lotNumber.toString()}",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: " ${myLots[index].entityName.toString()}")
                  ], style: TextStyle(color: Colors.black, fontSize: 14.sp)),
                ),
                Container(
                    height: 21,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                        color: const Color(0xff21212114).withOpacity(0.08)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        isSearching
                            ? result[index].listingStatus
                            : myLots[index].listingStatus,
                        style: GoogleFonts.inter(
                            fontSize: 10.sp, color: Color(0xff2F80ED)),
                      ),
                    ))
              ],
            ),
          ),
          Container(
            // alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Color(0xFFEFF6E4),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5))),
            height: 65,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                listBox(
                    isSearching
                        ? result[index].avgUhml.toString()
                        : myLots[index].avgUhml.toString(),
                    'staple'),
                listBox(
                    isSearching
                        ? result[index].avgMic.toString()
                        : myLots[index].avgMic.toString(),
                    'mic'),
                listBox(
                    isSearching
                        ? result[index].avgGtex.toString()
                        : myLots[index].avgGtex.toString(),
                    'gtex'),
                listBox(
                    isSearching
                        ? result[index].avgColorRd.toString()
                        : myLots[index].avgColorRd.toString(),
                    'rd')
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
