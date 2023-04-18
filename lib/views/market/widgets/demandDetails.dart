import 'package:first_cotton/helpers/theme.dart';
import 'package:first_cotton/services/api/createChatRoom.dart';
import 'package:first_cotton/view_models/chat_calls_db.dart';
import 'package:first_cotton/view_models/firebaseCalls.dart';
import 'package:first_cotton/views/market/widgets/databox.dart';
import 'package:first_cotton/views/market/widgets/placeBIdOVerlay.dart';
import 'package:first_cotton/views/market/widgets/updown.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../helpers/flutterToast.dart';
import '../../chatscreen/chatscreen.dart';
import '../../dashboard/dashboard.dart';

class DemandBottomSheet extends StatefulWidget {
  int index;
  List data;
  DemandBottomSheet({Key? key, required this.index, required this.data})
      : super(key: key);

  @override
  State<DemandBottomSheet> createState() => _DemandBottomSheetState();
}

class _DemandBottomSheetState extends State<DemandBottomSheet> {
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 10,),
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
                            "Staple",
                            style: Theme.of(context).textTheme.headlineSmall,
                          )
                        ],
                      ),
                    ],
                  ),
                 const SizedBox(width: 32,),
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
                            "Bales",
                            style: Theme.of(context).textTheme.headlineSmall,
                          )
                        ],
                      ),
                    ],
                  ),
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
                          Navigator.pop(context);
                          placeBid();

                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xFF2D9CDB),
                                    width: 1.sp)),
                            height: 7.h,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "PLACE BID",
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF2D9CDB),
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
                        // setState(() {
                        //   loading = true;
                        // });
                        // String docId =
                        //     items[widget.index].sId + '_' + userNumber;
                        // bool exist = await checkRoomStatus(docId);
                        // if (exist == false) {
                        //   Group? some = await createChatRoom(
                        //       items[widget.index].sId, docId);
                        //   bool created = await createRoomFirebase(
                        //       docId,
                        //       [
                        //         some!.sellerMobile,
                        //         some.buyerMobile,
                        //         some.staffMobile
                        //       ],
                        //       items[widget.index].entityName,
                        //       some.sellerMobile,
                        //       some.buyerName,
                        //       some.buyerMobile,
                        //       items[widget.index].lotNumber,
                        //       items[widget.index].sId);
                        //   if(created == false){
                        //     Helpers().showToast("Something went wrong!!!");
                        //   }
                        //   setState(() {
                        //     loading = false;
                        //   });
                        //   if (!mounted) return;
                        //   Navigator.pushReplacement(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (BuildContext ctx) => ChatScreen(
                        //             lotId: items[widget.index].sId,
                        //             groupId: docId,
                        //             groupTitle: items[widget.index]
                        //                 .lotNumber
                        //                 .toString(),
                        //             groupSubTitle:
                        //             items[widget.index].entityName,
                        //             counter: 0,
                        //           )));
                        // } else {
                        //   setState(() {
                        //     loading = false;
                        //   });
                        //   if (!mounted) return;
                        //   Navigator.pushReplacement(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (BuildContext context) => ChatScreen(
                        //             lotId: items[widget.index].sId,
                        //             groupId: docId,
                        //             groupTitle: items[widget.index]
                        //                 .lotNumber
                        //                 .toString(),
                        //             groupSubTitle:
                        //             items[widget.index].entityName,
                        //             counter: 0,
                        //           )));
                        // }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF2D9CDB),
                            border: Border.all(
                                color: const Color(0xFF2D9CDB),
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
            dataBox(items, widget.index,true),
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
  placeBid() {
    print('called');
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
      context: context,
      builder: (BuildContext context) {
        return const SingleChildScrollView(
          child: PlaceBidOverlay(),
        );
      },
    );
  }
}
