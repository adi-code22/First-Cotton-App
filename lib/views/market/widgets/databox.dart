import 'package:first_cotton/views/market/widgets/updown.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Container dataBox(List<dynamic> items, int index,bool isDemand) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      boxShadow: const [
        BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
            offset: Offset(0, 1),
            blurRadius: 4)
      ],
    ),
    height: 30.h,
    width: 100.w,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      isDemand ? 'Quality Requirements' :
                      'Test Summary',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )),
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 12.0,
                    ),
                    updown(
                        varr: "Staple", val: items[index].avgUhml.toString()),
                    updown(varr: "UI", val: items[index].avgUi.toString()),
                    updown(varr: "MIC", val: items[index].avgMic.toString()),
                    updown(varr: "gTex", val: items[index].avgGtex.toString())
                  ],
                ),
              )),

          // 2nd
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.grey[100],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 12.0,
                    ),
                    updown(varr: "Rd", val: items[index].avgColorRd.toString()),
                    updown(varr: "+b", val: items[index].avgColorB.toString()),
                    const updown(varr: "CG", val: '-'),
                    const updown(varr: "", val: '')
                  ],
                ),
              )),

          // 3rd Box
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 12.0,
                    ),
                    updown(
                        varr: "Elong", val: items[index].avgElong.toString()),
                    updown(varr: "SFI", val: items[index].avgSfi.toString()),
                    updown(
                        varr: "Trash", val: items[index].avgTrash.toString()),
                    const updown(varr: "", val: '')
                  ],
                ),
              )),
        ],
      ),
    ),
  );
}
