import 'package:first_cotton/views/chatscreen/widgets/contractConfirmation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class newContractWidget extends StatefulWidget {
  const newContractWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<newContractWidget> createState() => _newContractWidgetState();
}

class _newContractWidgetState extends State<newContractWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'New Contract',
                  style: GoogleFonts.inter(
                      fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Lot",
              style: GoogleFonts.inter(
                  fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.sp),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                  ), //border of dropdown button
                  borderRadius: BorderRadius.circular(
                      5), //border raiuds of dropdown button
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      icon:
                          Icon(Icons.keyboard_arrow_down_rounded, size: 30.sp),
                      value: "24156-SSV-Mills-100Bales",
                      isExpanded: true,
                      items: <String>[
                        '24156-SSV-Mills-100Bales',
                        'daat2',
                        'data3',
                        'data4'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (Object? value) {},
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Price/candy",
              style: GoogleFonts.inter(
                  fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.sp),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                  ), //border of dropdown button
                  borderRadius: BorderRadius.circular(
                      5), //border raiuds of dropdown button
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      icon:
                          Icon(Icons.keyboard_arrow_down_rounded, size: 30.sp),
                      value: "Rs 85,900",
                      isExpanded: true,
                      items: <String>[
                        'Rs 85,900',
                        'Rs data',
                        'Rs data',
                        'Rs data'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (Object? value) {},
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Terms",
              style: GoogleFonts.inter(
                  fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.sp),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                  ), //border of dropdown button
                  borderRadius: BorderRadius.circular(
                      5), //border raiuds of dropdown button
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      icon:
                          Icon(Icons.keyboard_arrow_down_rounded, size: 30.sp),
                      value: "7 Days",
                      isExpanded: true,
                      items: <String>['7 Days', '15 Days', '30 Days', '200']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (Object? value) {},
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "7 Days",
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: const Color(0xFF27AE60),
                          border: Border.all(
                              color: const Color(0xFF828282), width: 1.sp)),
                      height: 5.h,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "15 Days",
                          style: GoogleFonts.inter(
                            color: const Color(0xFF828282),
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(const Radius.circular(5)),
                          color: Colors.grey[100],
                          border: Border.all(
                              color: const Color(0xFF828282), width: 1.sp)),
                      height: 5.h,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "30 Days",
                          style: GoogleFonts.inter(
                            color: const Color(0xFF828282),
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(const Radius.circular(5)),
                          color: Colors.grey[100],
                          border: Border.all(
                              color: const Color(0xFF828282), width: 1.sp)),
                      height: 5.h,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "200",
                          style: GoogleFonts.inter(
                            color: const Color(0xFF828282),
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(const Radius.circular(5)),
                          color: Colors.grey[100],
                          border: Border.all(
                              color: const Color(0xFF828282), width: 1.sp)),
                      height: 5.h,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )),
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return const contractConfirmation();
                    });
              },
              child: Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "CREATE",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: const Color(0xFF27AE60),
                    border: Border.all(color: Colors.green, width: 1.sp)),
                height: 8.h,
              ),
            )
          ],
        ),
      ),
    );
  }
}
