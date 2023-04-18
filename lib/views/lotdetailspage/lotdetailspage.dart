import 'package:first_cotton/views/lotdetailspage/widgets/updown.dart';
import 'package:first_cotton/views/myLots/myLots.dart';
import 'package:first_cotton/views/myLots/widgets/myLotsCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class LotDetailsPage extends StatefulWidget {
  final int index;
  final List myLot;
  final bool isSearching;
  const LotDetailsPage(
      {Key? key,
      required this.index,
      required this.myLot,
      required this.isSearching})
      : super(key: key);

  @override
  State<LotDetailsPage> createState() => _LotDetailsPageState();
}

class _LotDetailsPageState extends State<LotDetailsPage> {
  bool changeStatus = false;

//InStock Text Label
  Widget inStock = Text(
    '  IN STOCK  ',
    textAlign: TextAlign.center,
    style: GoogleFonts.inter(fontSize: 10.sp, color: const Color(0xff2F80ED)),
  );

//Sold Text Label
  Widget sold = Text(
    '  SOLD  ',
    textAlign: TextAlign.center,
    style: GoogleFonts.inter(fontSize: 10.sp, color: const Color(0xff27AE60)),
  );

//Sold Private Text Label
  Widget soldPrivate = Text(
    '  SOLD PRIVATE  ',
    textAlign: TextAlign.center,
    style: GoogleFonts.inter(fontSize: 10.sp, color: const Color(0xffF2994A)),
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Lot Details " + widget.myLot[widget.index].lotNumber.toString(),
          style: GoogleFonts.inter(
              fontSize: 16.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 10,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       RichText(
            //         text: TextSpan(children: const [
            //           TextSpan(
            //             text: "456789 ",
            //             style: TextStyle(fontWeight: FontWeight.bold),
            //           ),
            //           TextSpan(
            //             text: "Bunny(100)",
            //           )
            //         ], style: TextStyle(color: Colors.black, fontSize: 15.sp)),
            //       ),
            //       Container(
            //           height: 21,
            //           decoration: BoxDecoration(
            //               borderRadius:
            //                   const BorderRadius.all(Radius.circular(25)),
            //               color: const Color(0xff21212114).withOpacity(0.08)),
            //           child: Align(
            //             alignment: Alignment.center,
            //             child: index == 1 || index == 3 || index == 5
            //                 ? soldPrivate
            //                 : index == 2 || index == 4 || index == 6
            //                     ? sold
            //                     : inStock,
            //           ))
            //     ],
            //   ),
            // ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: myLotsCard(
                    size, widget.index, widget.isSearching, result, myLots, 1)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
                        offset: Offset(0, 1),
                        blurRadius: 4)
                  ],
                ),
                height: 30.h,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 10.0,
                              ),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Test Summary",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 2.w,
                                ),
                                const updown(varr: "Staple", val: "25.8"),
                                updown(
                                    varr: "UI",
                                    val: widget.myLot[widget.index].avgUi
                                        .toString()),
                                updown(
                                    varr: "MIC",
                                    val: widget.myLot[widget.index].avgMic
                                        .toString()),
                                updown(
                                    varr: "gTex",
                                    val: widget.myLot[widget.index].avgGtex
                                        .toString()),
                              ],
                            ),
                          )),

                      // 2nd
                      Expanded(
                          flex: 2,
                          child: Container(
                            color: Colors.grey[100],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 2.w,
                                ),
                                updown(
                                    varr: "Rd",
                                    val: widget.myLot[widget.index].avgColorRd
                                        .toString()),
                                updown(
                                    varr: "+b",
                                    val: widget.myLot[widget.index].avgColorB
                                        .toString()),
                                const updown(varr: "CG", val: '-'),
                                SizedBox(
                                  width: 15.w,
                                ),
                              ],
                            ),
                          )),

                      // 3rd Box
                      Expanded(
                          flex: 2,
                          child: Container(
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 2.w,
                                ),
                                updown(
                                    varr: "Elong",
                                    val: widget.myLot[widget.index].avgElong
                                        .toString()),
                                updown(
                                    varr: "SFI",
                                    val: widget.myLot[widget.index].avgSfi
                                        .toString()),
                                updown(
                                    varr: "Trash",
                                    val: widget.myLot[widget.index].avgTrash
                                        .toString()),
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "CHANGE STATUS",
                                style: TextStyle(
                                    color: changeStatus
                                        ? Colors.green
                                        : Colors.grey,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: changeStatus
                                        ? Colors.green
                                        : Colors.grey,
                                    width: 2.sp)),
                            height: 10.h,
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                          onTap: () async {
                            final Uri _url = Uri.parse(
                                widget.myLot[widget.index].testCertificateLink);
                            if (!await launchUrl(_url,
                                mode: LaunchMode.externalApplication))
                              throw 'Could not launch $_url';
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "CERTIFICATE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  border: Border.all(
                                      color: Colors.green, width: 1.sp)),
                              height: 10.h,
                            ),
                          ),
                        ),
                      ))
                ],
              ),
              width: double.infinity,
              height: 8.h,
              color: Colors.white60,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
                        offset: Offset(0, 1),
                        blurRadius: 4)
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 15.h,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Visible Groups",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            pill("First Cotton Default"),
                          ],
                        ))
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     ClipRRect(
                    //       borderRadius: BorderRadius.circular(20),
                    //       child: Container(
                    //         child: const Padding(
                    //           padding: EdgeInsets.only(left: 12, right: 12),
                    //           child: Align(
                    //             alignment: Alignment.center,
                    //             child: Text(
                    //               "Coimbatore 1",
                    //               style: TextStyle(fontWeight: FontWeight.bold),
                    //             ),
                    //           ),
                    //         ),
                    //         height: 21.sp,
                    //         color: const Color(0xffededed),
                    //       ),
                    //     ),
                    //     ClipRRect(
                    //       borderRadius: BorderRadius.circular(20),
                    //       child: Container(
                    //         child: const Padding(
                    //           padding: EdgeInsets.only(left: 12, right: 12),
                    //           child: Align(
                    //             alignment: Alignment.center,
                    //             child: Text(
                    //               "Coimbatore 2",
                    //               style: TextStyle(fontWeight: FontWeight.bold),
                    //             ),
                    //           ),
                    //         ),
                    //         height: 21.sp,
                    //         color: const Color(0xffededed),
                    //       ),
                    //     ),
                    //     ClipRRect(
                    //       borderRadius: BorderRadius.circular(20),
                    //       child: Container(
                    //         child: const Padding(
                    //           padding: EdgeInsets.only(left: 12, right: 12),
                    //           child: Align(
                    //             alignment: Alignment.center,
                    //             child: Text(
                    //               "Madurai",
                    //               style: TextStyle(fontWeight: FontWeight.bold),
                    //             ),
                    //           ),
                    //         ),
                    //         height: 21.sp,
                    //         color: const Color(0xffededed),
                    //       ),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listBox(String title, String subtitle) {
    return SizedBox(
      height: 36,
      //width: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(fontSize: 14.sp),
          ),
          Text(
            subtitle,
            style:
                GoogleFonts.inter(color: const Color(0xff828282), fontSize: 10),
          )
        ],
      ),
    );
  }
}

// Widget function to return a pill widget with text
Widget pill(String groupName) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Container(
      child: Padding(
        padding: EdgeInsets.only(left: 12, right: 12),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            groupName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      height: 21.sp,
      color: const Color(0xffededed),
    ),
  );
}
