import 'package:first_cotton/helpers/theme.dart';
import 'package:first_cotton/services/api/createChatRoom.dart';
import 'package:first_cotton/view_models/chat_calls_db.dart';
import 'package:first_cotton/view_models/firebaseCalls.dart';
import 'package:first_cotton/views/market/widgets/databox.dart';
import 'package:first_cotton/views/market/widgets/updown.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../helpers/flutterToast.dart';
import '../../chatscreen/chatscreen.dart';
import '../../dashboard/dashboard.dart';

class MyBottomSheet extends StatefulWidget {
  int index;
  List data;
  MyBottomSheet({Key? key, required this.index, required this.data})
      : super(key: key);

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    List items = widget.data;

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    items[widget.index].entityName,
                    style: GoogleFonts.inter(fontSize: 14.sp),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 10.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
                      offset: Offset(0, 1),
                      blurRadius: 4)
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[widget.index].station,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          Text(
                            "Station",
                            style: Theme.of(context).textTheme.headlineSmall,
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
                            items[widget.index].lotNumber.toString(),
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          Text(
                            "Bunny",
                            style: Theme.of(context).textTheme.headlineSmall,
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
                            '${items[widget.index].terms} Days',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          Text(
                            "Terms",
                            style: Theme.of(context).textTheme.headlineSmall,
                          )
                        ],
                      ),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Text(
                      //       items[widget.index].avgGtex.toString(),
                      //       style: GoogleFonts.inter(
                      //         fontSize: 14.sp,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //     Text(
                      //       "strength",
                      //       style: GoogleFonts.inter(
                      //           color: Colors.grey, fontSize: 10.sp),
                      //     )
                      //   ],
                      // ),
                    ],
                  ),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     ClipRRect(
                  //       borderRadius: BorderRadius.circular(20),
                  //       child: Container(
                  //         height: 34,
                  //         width: 73,
                  //         color: const Color(
                  //             // ignore: use_full_hex_values_for_flutter_colors
                  //             0xff21212114).withOpacity(0.1),
                  //         child: Align(
                  //           alignment: Alignment.center,
                  //           child: Padding(
                  //             padding: const EdgeInsets.only(
                  //                 top: 5.0, bottom: 5, left: 10, right: 10),
                  //             child: Text(
                  //               "₹" + items[widget.index].askPrice.toString(),
                  //               style: GoogleFonts.inter(
                  //                   fontSize: 16.sp,
                  //                   color:
                  //                       const Color(0xff27AE60)),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     // Column(
                  //     //   crossAxisAlignment: CrossAxisAlignment.start,
                  //     //   children: [
                  //     //     Text(
                  //     //       items[widget.index].avgColorRd.toString(),
                  //     //       style: GoogleFonts.inter(
                  //     //         fontSize: 14.sp,
                  //     //         fontWeight: FontWeight.bold,
                  //     //       ),
                  //     //     ),
                  //     //     Text(
                  //     //       "Rd",
                  //     //       style: GoogleFonts.inter(
                  //     //           color: Colors.grey, fontSize: 10.sp),
                  //     //     )
                  //     //   ],
                  //     // ),
                  //   ],
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: GestureDetector(
                        onTap: () async {
                          final Uri _url = Uri.parse(
                              items[widget.index].testCertificateLink);
                          if (!await launchUrl(_url,
                              mode: LaunchMode.externalApplication))
                            throw 'Could not launch $_url';
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 1.sp)),
                            height: 7.h,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "TEST CERTIFICATE",
                                style: GoogleFonts.inter(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () async {
                        setState(() {
                          loading = true;
                        });
                        String docId =
                            items[widget.index].sId + '_' + userNumber;
                        bool exist = await checkRoomStatus(docId);
                        if (exist == false) {
                          Group? some = await createChatRoom(
                              items[widget.index].sId, docId);
                          bool created = await createRoomFirebase(
                              docId,
                              [
                                some!.sellerMobile,
                                some.buyerMobile,
                                some.staffMobile
                              ],
                              items[widget.index].entityName,
                              some.sellerMobile,
                              some.buyerName,
                              some.buyerMobile,
                              items[widget.index].lotNumber,
                              items[widget.index].sId);
                          if(created == false){
                            Helpers().showToast("Something went wrong!!!");
                          }
                          setState(() {
                            loading = false;
                          });
                          if (!mounted) return;
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext ctx) => ChatScreen(
                                    lotId: items[widget.index].sId,
                                    groupId: docId,
                                    groupTitle: items[widget.index]
                                        .lotNumber
                                        .toString(),
                                    groupSubTitle:
                                    items[widget.index].entityName,
                                    counter: 0, isLot: true,
                                  )));
                        } else {
                          setState(() {
                            loading = false;
                          });
                          if (!mounted) return;
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => ChatScreen(
                                        lotId: items[widget.index].sId,
                                        groupId: docId,
                                        groupTitle: items[widget.index]
                                            .lotNumber
                                            .toString(),
                                        groupSubTitle:
                                            items[widget.index].entityName,
                                        counter: 0, isLot: true,
                                      )));
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 1.sp),
                          ),
                          height: 7.h,
                          child: Align(
                            alignment: Alignment.center,
                            child: loading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    "MESSAGE",
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            dataBox(items, widget.index,false),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          if (widget.index > 0) {
                            widget.index--;
                            setState(() {});
                          }
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                border: Border.all(
                                    color: Colors.grey, width: 1.sp)),
                            height: 7.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.arrow_back,
                                  color: Colors.grey,
                                ),
                                Text(
                                  " PREV",
                                  style: GoogleFonts.inter(
                                    color: Colors.grey,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      if (widget.index < items.length - 1) {
                        widget.index++;
                        setState(() {});
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            border:
                                Border.all(color: Colors.grey, width: 1.sp)),
                        height: 7.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "NEXT  ",
                              style: GoogleFonts.inter(
                                color: Colors.grey,
                                fontSize: 12.sp,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
