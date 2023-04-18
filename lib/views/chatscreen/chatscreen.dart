import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:first_cotton/helpers/flutterToast.dart';
import 'package:first_cotton/view_models/download_pdf.dart';
import 'package:first_cotton/view_models/firebaseCalls.dart';
import 'package:first_cotton/view_models/singleLotDetailsCall.dart';
import 'package:first_cotton/views/chatscreen/widgets/messagein.dart';
import 'package:first_cotton/views/chatscreen/widgets/messageout.dart';
import 'package:first_cotton/views/market/widgets/updown.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:first_cotton/views/chatscreen/widgets/newContract.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import '../../services/api/sendFiles.dart';
import '../../services/api/singlelotapi.dart';
import '../../view_models/sendMessage.dart';
import '../dashboard/dashboard.dart';
import 'widgets/sendImage.dart';
const blueColor =   Color(0xFF2D9CDB);
class ChatScreen extends StatefulWidget {
  final String lotId;
  final String groupId;
  final String groupTitle;
  final String groupSubTitle;
  final bool isLot;
  int counter;

  ChatScreen(
      {Key? key,
      required this.lotId,
      required this.groupId,
      required this.groupTitle,
      required this.groupSubTitle,
      required this.counter, required this.isLot})
      : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

const kUrl1 = 'https://luan.xyz/files/audio/ambient_c_motion.mp3';
const kUrl2 = 'https://luan.xyz/files/audio/nasa_on_a_mission.mp3';
const kUrl3 = 'http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1xtra_mf_p';
File? imgFile;
class _ChatScreenState extends State<ChatScreen> {
  AudioPlayer advancedPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();


  final TextEditingController _controller = TextEditingController();

  final imgPicker = ImagePicker();
  void openGallery() async {
    var images = await imgPicker.pickMultiImage(
      imageQuality: 10
    );
    // images!.first.path;
    // var imgNotice = await imgPicker.pickImage(
    //     source: ImageSource.gallery, imageQuality: 10);
    if (images!.isEmpty) return;
    setState((){
      imgFile = File(images.first.path);
    });
    if(!mounted)return;
    Navigator.push(context, MaterialPageRoute(builder: ((BuildContext context) =>
        SendImage(imgSrs: imgFile!, count: widget.counter,chatRoomId: widget.groupId,
          images: images,))));

  }

  Data? lotData;
  getData() async {
    lotData = await singleLotDetailsData(widget.lotId);
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomAppBar(
      //   child:
      // ),
      backgroundColor: const Color(0xFFF4F4DD),

      //AppBar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          color: Colors.transparent,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 20.sp,
            ),
            onPressed: () {
              checkGroup(userName, widget.groupId);
              Navigator.pop(context);
            },
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: widget.groupTitle + " ",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp),
            ),
            TextSpan(
              text: widget.groupSubTitle,
              style: TextStyle(color: Colors.black, fontSize: 15.sp),
            )
          ]),
        ),
        leadingWidth: 7.5.w,
        centerTitle: false,
      ),

      //body
      body: WillPopScope(
        onWillPop: () async {
          checkGroup(userName, widget.groupId);
          Navigator.pop(context);
          return false;
        },
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 8.h,
              color: Colors.white60,
              child:widget.isLot ? Row(
                children: [
                  //Lot Details Button
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          transitionDuration: const Duration(milliseconds: 500),
                          barrierLabel:
                              MaterialLocalizations.of(context).dialogLabel,
                          barrierColor: Colors.black.withOpacity(0.5),
                          pageBuilder: (context, _, __) {
                            return lotData != null
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: const Color(0xffF2F2F2),
                                        child: Card(
                                          child: ListView(
                                            shrinkWrap: true,
                                            children: <Widget>[
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        lotData!.lotsResult!
                                                            .first.entityName!,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 17.sp),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 10.h,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Colors.white,
                                                      boxShadow: const [
                                                        BoxShadow(
                                                            color: Color.fromRGBO(
                                                                0,
                                                                0,
                                                                0,
                                                                0.10000000149011612),
                                                            offset:
                                                                Offset(0, 1),
                                                            blurRadius: 4)
                                                      ],
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  lotData!
                                                                      .lotsResult!
                                                                      .first
                                                                      .station!,
                                                                  style: GoogleFonts.inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          16.sp),
                                                                ),
                                                                Text(
                                                                  "Station",
                                                                  style: GoogleFonts.inter(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          9.sp),
                                                                )
                                                              ],
                                                            ),
                                                            // Column(
                                                            //   crossAxisAlignment: CrossAxisAlignment.start,
                                                            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            //   children: [
                                                            //     Text(
                                                            //       '90.0 mm',
                                                            //       style: GoogleFonts.inter(
                                                            //         fontSize: 14.sp,
                                                            //         fontWeight: FontWeight.bold,
                                                            //       ),
                                                            //     ),
                                                            //     Text(
                                                            //       "Staple",
                                                            //       style: GoogleFonts.inter(
                                                            //           color: Colors.grey, fontSize: 10.sp),
                                                            //     )
                                                            //   ],
                                                            // ),
                                                          ],
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  lotData!
                                                                      .lotsResult!
                                                                      .first
                                                                      .lotNumber
                                                                      .toString(),
                                                                  style: GoogleFonts.inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          16.sp),
                                                                ),
                                                                Text(
                                                                  "Bunny",
                                                                  style: GoogleFonts.inter(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          9.sp),
                                                                )
                                                              ],
                                                            ),
                                                            // Column(
                                                            //   crossAxisAlignment: CrossAxisAlignment.start,
                                                            //   children: [
                                                            //     Text(
                                                            //       items[widget.index].avgMic.toString(),
                                                            //       style: GoogleFonts.inter(
                                                            //         fontSize: 14.sp,
                                                            //         fontWeight: FontWeight.bold,
                                                            //       ),
                                                            //     ),
                                                            //     Text(
                                                            //       "MIC",
                                                            //       style: GoogleFonts.inter(
                                                            //           color: Colors.grey, fontSize: 10.sp),
                                                            //     )
                                                            //   ],
                                                            // ),
                                                          ],
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  '${lotData!.lotsResult!.first.terms} Days',
                                                                  style: GoogleFonts.inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          16.sp),
                                                                ),
                                                                Text(
                                                                  "Terms",
                                                                  style: GoogleFonts.inter(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          10.sp),
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
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              child: Container(
                                                                height: 30,
                                                                width: 73,
                                                                color: const Color(
                                                                    // ignore: use_full_hex_values_for_flutter_colors
                                                                    0xff21212114).withOpacity(0),
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets.only(
                                                                        top:
                                                                            5.0,
                                                                        bottom:
                                                                            5,
                                                                        left:
                                                                            10,
                                                                        right:
                                                                            10),
                                                                    child: Text(
                                                                      "₹" +
                                                                          lotData!
                                                                              .lotsResult!
                                                                              .first
                                                                              .askPrice
                                                                              .toString(),
                                                                      style: GoogleFonts.inter(
                                                                          fontSize: 16
                                                                              .sp,
                                                                          color:
                                                                              const Color(0xff27AE60).withOpacity(0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            // Column(
                                                            //   crossAxisAlignment: CrossAxisAlignment.start,
                                                            //   children: [
                                                            //     Text(
                                                            //       items[widget.index].avgColorRd.toString(),
                                                            //       style: GoogleFonts.inter(
                                                            //         fontSize: 14.sp,
                                                            //         fontWeight: FontWeight.bold,
                                                            //       ),
                                                            //     ),
                                                            //     Text(
                                                            //       "Rd",
                                                            //       style: GoogleFonts.inter(
                                                            //           color: Colors.grey, fontSize: 10.sp),
                                                            //     )
                                                            //   ],
                                                            // ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                            color: Color.fromRGBO(
                                                                0,
                                                                0,
                                                                0,
                                                                0.10000000149011612),
                                                            offset:
                                                                Offset(0, 1),
                                                            blurRadius: 4)
                                                      ],
                                                    ),
                                                    height: 30.h,
                                                    width: 100.w,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      child: Column(
                                                        //crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Expanded(
                                                              flex: 2,
                                                              child: Container(
                                                                color: Colors
                                                                    .white,
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          8.0),
                                                                  child: Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                    child: Text(
                                                                      'Test Summary',
                                                                      style: TextStyle(
                                                                          fontSize: 15
                                                                              .sp,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )),
                                                          Expanded(
                                                              flex: 2,
                                                              child: Container(
                                                                color: Colors
                                                                    .white,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    const SizedBox(
                                                                      width:
                                                                          12.0,
                                                                    ),
                                                                    updown(
                                                                        varr:
                                                                            "Staple",
                                                                        val:
                                                                            "${lotData!.lotsResult!.first.avgUhml} mm"),
                                                                    updown(
                                                                        varr:
                                                                            "UI",
                                                                        val: lotData!
                                                                            .lotsResult!
                                                                            .first
                                                                            .avgUi
                                                                            .toString()),
                                                                    updown(
                                                                        varr:
                                                                            "MIC",
                                                                        val:
                                                                            "${lotData!.lotsResult!.first.avgMic}"),
                                                                    updown(
                                                                        varr:
                                                                            "gTex",
                                                                        val:
                                                                            "${lotData!.lotsResult!.first.avgGtex}"),
                                                                  ],
                                                                ),
                                                              )),

                                                          // 2nd
                                                          Expanded(
                                                              flex: 2,
                                                              child: Container(
                                                                color: Colors
                                                                    .grey[100],
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    const SizedBox(
                                                                      width:
                                                                          12.0,
                                                                    ),
                                                                    updown(
                                                                        varr:
                                                                            "Rd",
                                                                        val:
                                                                            "${lotData!.lotsResult!.first.avgColorRd}"),
                                                                    updown(
                                                                        varr:
                                                                            "+b",
                                                                        val:
                                                                            "${lotData!.lotsResult!.first.avgColorB}"),
                                                                    const updown(
                                                                        varr:
                                                                            "CG",
                                                                        val:
                                                                            '-'),
                                                                    const updown(
                                                                        varr:
                                                                            "",
                                                                        val: '')
                                                                  ],
                                                                ),
                                                              )),

                                                          // 3rd Box
                                                          Expanded(
                                                              flex: 2,
                                                              child: Container(
                                                                color: Colors
                                                                    .white,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    const SizedBox(
                                                                      width:
                                                                          12.0,
                                                                    ),
                                                                    updown(
                                                                        varr:
                                                                            "Elong",
                                                                        val:
                                                                            "${lotData!.lotsResult!.first.avgElong}"),
                                                                    updown(
                                                                        varr:
                                                                            "SFI",
                                                                        val:
                                                                            "${lotData!.lotsResult!.first.avgSfi}"),
                                                                    updown(
                                                                        varr:
                                                                            "Trash",
                                                                        val:
                                                                            "${lotData!.lotsResult!.first.avgTrash}"),
                                                                    const updown(
                                                                        varr:
                                                                            "",
                                                                        val: '')
                                                                  ],
                                                                ),
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 2.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .red,
                                                                        width: 1
                                                                            .sp)),
                                                                height: 6.h,
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: Text(
                                                                    "CLOSE",
                                                                    style: GoogleFonts
                                                                        .inter(
                                                                      color: Colors
                                                                          .red,
                                                                      fontSize:
                                                                          15.sp,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : const Center(
                                    child: CircularProgressIndicator());
                          },
                          transitionBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return SlideTransition(
                              position: CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeOut,
                              ).drive(Tween<Offset>(
                                begin: const Offset(0, -1.0),
                                end: Offset.zero,
                              )),
                              child: child,
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 1.sp)),
                            height: 6.h,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Lot Details",
                                style: GoogleFonts.inter(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Certificate Button
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () async {
                          final Uri _url = Uri.parse(
                              lotData!.lotsResult!.first.testCertificateLink!);
                          // print(_url);
                          String fileName = lotData!.lotsResult!.first.testCertificateLink!.
                          split('https://assets.beta.agridayco.com/').last.split('.').first;
                          downloadAndLaunch(lotData!.lotsResult!.first.testCertificateLink!,fileName );
                          // if (!await launchUrl(_url,
                          //     mode: LaunchMode.externalApplication))
                          //   throw 'Could not launch $_url';
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 1.sp)),
                            height: 6.h,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Certificate",
                                style: GoogleFonts.inter(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ) :
              Row(
                children: [
                  //Lot Details Button
                  Expanded(
                    flex: 3,
                    child: GestureDetector(
                      onTap: () {
                        showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          transitionDuration: const Duration(milliseconds: 500),
                          barrierLabel:
                          MaterialLocalizations.of(context).dialogLabel,
                          barrierColor: Colors.black.withOpacity(0.5),
                          pageBuilder: (context, _, __) {
                            return lotData != null
                                ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width:
                                  MediaQuery.of(context).size.width,
                                  color: const Color(0xffF2F2F2),
                                  child: Card(
                                    child: ListView(
                                      shrinkWrap: true,
                                      children: <Widget>[
                                        Column(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.all(
                                                  8.0),
                                              child: Align(
                                                alignment:
                                                Alignment.centerLeft,
                                                child: Text(
                                                  lotData!.lotsResult!
                                                      .first.entityName!,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17.sp),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 10.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    5),
                                                color: Colors.white,
                                                boxShadow: const [
                                                  BoxShadow(
                                                      color: Color.fromRGBO(
                                                          0,
                                                          0,
                                                          0,
                                                          0.10000000149011612),
                                                      offset:
                                                      Offset(0, 1),
                                                      blurRadius: 4)
                                                ],
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceAround,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text(
                                                            lotData!
                                                                .lotsResult!
                                                                .first
                                                                .station!,
                                                            style: GoogleFonts.inter(
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                fontSize:
                                                                16.sp),
                                                          ),
                                                          Text(
                                                            "Station",
                                                            style: GoogleFonts.inter(
                                                                color: Colors
                                                                    .grey,
                                                                fontSize:
                                                                9.sp),
                                                          )
                                                        ],
                                                      ),
                                                      // Column(
                                                      //   crossAxisAlignment: CrossAxisAlignment.start,
                                                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      //   children: [
                                                      //     Text(
                                                      //       '90.0 mm',
                                                      //       style: GoogleFonts.inter(
                                                      //         fontSize: 14.sp,
                                                      //         fontWeight: FontWeight.bold,
                                                      //       ),
                                                      //     ),
                                                      //     Text(
                                                      //       "Staple",
                                                      //       style: GoogleFonts.inter(
                                                      //           color: Colors.grey, fontSize: 10.sp),
                                                      //     )
                                                      //   ],
                                                      // ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text(
                                                            lotData!
                                                                .lotsResult!
                                                                .first
                                                                .lotNumber
                                                                .toString(),
                                                            style: GoogleFonts.inter(
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                fontSize:
                                                                16.sp),
                                                          ),
                                                          Text(
                                                            "Bunny",
                                                            style: GoogleFonts.inter(
                                                                color: Colors
                                                                    .grey,
                                                                fontSize:
                                                                9.sp),
                                                          )
                                                        ],
                                                      ),
                                                      // Column(
                                                      //   crossAxisAlignment: CrossAxisAlignment.start,
                                                      //   children: [
                                                      //     Text(
                                                      //       items[widget.index].avgMic.toString(),
                                                      //       style: GoogleFonts.inter(
                                                      //         fontSize: 14.sp,
                                                      //         fontWeight: FontWeight.bold,
                                                      //       ),
                                                      //     ),
                                                      //     Text(
                                                      //       "MIC",
                                                      //       style: GoogleFonts.inter(
                                                      //           color: Colors.grey, fontSize: 10.sp),
                                                      //     )
                                                      //   ],
                                                      // ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text(
                                                            '${lotData!.lotsResult!.first.terms} Days',
                                                            style: GoogleFonts.inter(
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                fontSize:
                                                                16.sp),
                                                          ),
                                                          Text(
                                                            "Terms",
                                                            style: GoogleFonts.inter(
                                                                color: Colors
                                                                    .grey,
                                                                fontSize:
                                                                10.sp),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            20),
                                                        child: Container(
                                                          height: 30,
                                                          width: 73,
                                                          color: const Color(
                                                            // ignore: use_full_hex_values_for_flutter_colors
                                                              0xff21212114).withOpacity(0),
                                                          child: Align(
                                                            alignment:
                                                            Alignment
                                                                .center,
                                                            child:
                                                            Padding(
                                                              padding: const EdgeInsets.only(
                                                                  top:
                                                                  5.0,
                                                                  bottom:
                                                                  5,
                                                                  left:
                                                                  10,
                                                                  right:
                                                                  10),
                                                              child: Text(
                                                                "₹" +
                                                                    lotData!
                                                                        .lotsResult!
                                                                        .first
                                                                        .askPrice
                                                                        .toString(),
                                                                style: GoogleFonts.inter(
                                                                    fontSize: 16
                                                                        .sp,
                                                                    color:
                                                                    const Color(0xff27AE60).withOpacity(0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    5),
                                                boxShadow: const [
                                                  BoxShadow(
                                                      color: Color.fromRGBO(
                                                          0,
                                                          0,
                                                          0,
                                                          0.10000000149011612),
                                                      offset:
                                                      Offset(0, 1),
                                                      blurRadius: 4)
                                                ],
                                              ),
                                              height: 30.h,
                                              width: 100.w,
                                              child: ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    5),
                                                child: Column(
                                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          color: Colors
                                                              .white,
                                                          child: Padding(
                                                            padding: const EdgeInsets
                                                                .only(
                                                                left:
                                                                8.0),
                                                            child: Align(
                                                              alignment:
                                                              Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                'Test Summary',
                                                                style: TextStyle(
                                                                    fontSize: 15
                                                                        .sp,
                                                                    fontWeight:
                                                                    FontWeight.bold),
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                    Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          color: Colors
                                                              .white,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                            children: [
                                                              const SizedBox(
                                                                width:
                                                                12.0,
                                                              ),
                                                              updown(
                                                                  varr:
                                                                  "Staple",
                                                                  val:
                                                                  "${lotData!.lotsResult!.first.avgUhml} mm"),
                                                              updown(
                                                                  varr:
                                                                  "UI",
                                                                  val: lotData!
                                                                      .lotsResult!
                                                                      .first
                                                                      .avgUi
                                                                      .toString()),
                                                              updown(
                                                                  varr:
                                                                  "MIC",
                                                                  val:
                                                                  "${lotData!.lotsResult!.first.avgMic}"),
                                                              updown(
                                                                  varr:
                                                                  "gTex",
                                                                  val:
                                                                  "${lotData!.lotsResult!.first.avgGtex}"),
                                                            ],
                                                          ),
                                                        )),

                                                    // 2nd
                                                    Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          color: Colors
                                                              .grey[100],
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                            children: [
                                                              const SizedBox(
                                                                width:
                                                                12.0,
                                                              ),
                                                              updown(
                                                                  varr:
                                                                  "Rd",
                                                                  val:
                                                                  "${lotData!.lotsResult!.first.avgColorRd}"),
                                                              updown(
                                                                  varr:
                                                                  "+b",
                                                                  val:
                                                                  "${lotData!.lotsResult!.first.avgColorB}"),
                                                              const updown(
                                                                  varr:
                                                                  "CG",
                                                                  val:
                                                                  '-'),
                                                              const updown(
                                                                  varr:
                                                                  "",
                                                                  val: '')
                                                            ],
                                                          ),
                                                        )),

                                                    // 3rd Box
                                                    Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          color: Colors
                                                              .white,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                            children: [
                                                              const SizedBox(
                                                                width:
                                                                12.0,
                                                              ),
                                                              updown(
                                                                  varr:
                                                                  "Elong",
                                                                  val:
                                                                  "${lotData!.lotsResult!.first.avgElong}"),
                                                              updown(
                                                                  varr:
                                                                  "SFI",
                                                                  val:
                                                                  "${lotData!.lotsResult!.first.avgSfi}"),
                                                              updown(
                                                                  varr:
                                                                  "Trash",
                                                                  val:
                                                                  "${lotData!.lotsResult!.first.avgTrash}"),
                                                              const updown(
                                                                  varr:
                                                                  "",
                                                                  val: '')
                                                            ],
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(8.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          3),
                                                      child:
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .red,
                                                                  width: 1
                                                                      .sp)),
                                                          height: 6.h,
                                                          child: Align(
                                                            alignment:
                                                            Alignment
                                                                .center,
                                                            child: Text(
                                                              "CLOSE",
                                                              style: GoogleFonts
                                                                  .inter(
                                                                color: Colors
                                                                    .red,
                                                                fontSize:
                                                                15.sp,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                                : const Center(
                                child: CircularProgressIndicator());
                          },
                          transitionBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return SlideTransition(
                              position: CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeOut,
                              ).drive(Tween<Offset>(
                                begin: const Offset(0, -1.0),
                                end: Offset.zero,
                              )),
                              child: child,
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: blueColor,
                                    width: 1.sp)),
                            height: 6.h,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Lot Details",
                                style: GoogleFonts.inter(
                                  color: blueColor,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Certificate Button
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () async {
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: blueColor,
                                    width: 1.sp)),
                            height: 6.h,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Demand Info",
                                style: GoogleFonts.inter(
                                  color: blueColor,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () async {
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: blueColor,
                                    width: 1.sp)),
                            height: 6.h,
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "₹90,900",
                                  style: GoogleFonts.inter(
                                    // letterSpacing: 0.25,
                                    color: blueColor,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Icon(Icons.edit,color: blueColor,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ) ,
            ),

            SizedBox(
              height: 2.h,
            ),
            Flexible(flex: 2, child: chatMessages()),
            Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
                        offset: Offset(0, 1),
                        blurRadius: 4)
                  ]),
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    width: 15,
                    height: 55,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return FractionallySizedBox(
                                      heightFactor: 0.20,
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      newContract();
                                                    },
                                                    icon: const Icon(
                                                      Icons.edit_note_rounded,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Contract",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 10.sp),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  IconButton(
                                                    onPressed: () async {
                                                      Navigator.pop(context);
                                                      // Pick an image
                                                      openGallery();
                                                    },
                                                    icon: const Icon(
                                                      Icons.image,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Images",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 10.sp),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      print(imgFile);
                                                      Navigator.pop(context);
                                                    },
                                                    icon: const Icon(
                                                      Icons
                                                          .account_circle_rounded,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Contact",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 10.sp),
                                                  )
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  IconButton(
                                                    onPressed: () async {
                                                      Navigator.pop(context);
                                                      FilePickerResult? result =
                                                          await FilePicker
                                                              .platform
                                                              .pickFiles(
                                                        type: FileType.custom,
                                                        allowedExtensions: [
                                                          'pdf'
                                                        ],
                                                      );
                                                    String pdfLink =
                                                    await sendFilesToDb(File(result!.paths.first.toString()),'pdf');
                                                    if(pdfLink!= 'Something Went Wrong!!!'){
                                                    addMessage(widget.groupId, widget.counter++, true, pdfLink);}

                                                    },
                                                    icon: const Icon(
                                                      Icons.note_add,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Docs",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 10.sp),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            },
                            icon: const Icon(Icons.attach_file_outlined)),
                        Flexible(
                          flex: 4,
                          child: TextField(
                            controller: _controller,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(3),
                                hintText: "Message",
                                hintStyle: TextStyle(color: Colors.black54),
                                border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  IconButton(
                    color: const Color(0xFFF4F4DD),
                    onPressed: () async{
                      if (_controller.text != '') {
                        widget.counter = widget.counter + 1;
                        String tempMsg = _controller.text;
                        _controller.text = "";
                        await addMessage(widget.groupId, widget.counter, false,
                            tempMsg);
                      }
                    },
                    icon: Icon(
                      Icons.send,
                      color: Theme.of(context).primaryColor,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  newContract() {
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      )),
      context: context,
      builder: (BuildContext context) {
        return const newContractWidget();
      },
    );
  }

//   addMessage(chatRoomId, int count, bool isImage, String message) async {
//     // isImage ? message = messageTextEditting: message = messageTextEditting.text   ;
//     var lastMessageTs = DateTime.now().millisecondsSinceEpoch;
//     // var pic = MyEncryptionDecryption.encryptAES(message);
// //messageId
// //     if (messageId == "") {
// //       messageId = randomAlphaNumeric(12);
//     _controller.text = "";
//     // var aes = MyEncryptionDecryption.encryptAES(message);
//     Map<String, dynamic> messageInfoMap = {
//       "message": message,
//       "sendBy": userName,
//       "ts": lastMessageTs,
//       "isImage": isImage,
//     };
//
//     await addMessageToDb(chatRoomId, messageInfoMap).then((value) async {
//       print(count);
//       Map<String, dynamic> lastMessageInfoMap = {
//         "lastMessage": message,
//         "lastMessageSendTs": lastMessageTs,
//         "lastMessageSendBy": userName,
//         "readStatus": [userNumber],
//         "count": count,
//         "show": true,
//         "isImage": isImage,
//       };
//       await updateLastMessageSend(chatRoomId, lastMessageInfoMap);
//     });
//   }

  Widget chatMessages() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("chatRooms")
          .doc(widget.groupId)
          .collection("chats")
          .orderBy("ts", descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        audioCache.play('tones/tone.mp3');
        return snapshot.hasData
            ? ListView.builder(
                padding: const EdgeInsets.only(bottom: 10, top: 16),
                itemCount: snapshot.data?.docs.length,
                reverse: true,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data!.docs[index];
                  return chatMessageTile(
                      ds['message'],
                      userName == ds['sendBy'],
                      ds['ts'],
                      ds['isImage'],
                      context,
                      ds['sendBy']);
                })
            : const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget chatMessageTile(
      String message, bool sendByMe, int time, bool isImage, context, sendBy) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          sendByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment:
              sendByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 70.w),
              decoration: BoxDecoration(
                color: sendByMe ? const Color(0xff27AE60) : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  bottomLeft: sendByMe
                      ? const Radius.circular(10)
                      : const Radius.circular(0),
                  topRight: const Radius.circular(10),
                  bottomRight: sendByMe
                      ? const Radius.circular(0)
                      : const Radius.circular(10),
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              padding: isImage
                  ? const EdgeInsets.all(05)
                  : const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
              child: isImage
                  ? GestureDetector(
                      onTap: () {},
                      child: sendByMe
                          ? ImageSent(message)
                          : ImageReceived(message))
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: sendByMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        sendByMe
                            ? const SizedBox()
                            : Text(
                                sendBy,
                                style: GoogleFonts.inter(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: sendByMe
                                      ? Colors.white
                                      : const Color.fromRGBO(79, 79, 79, 1),
                                ),
                              ),
                        const SizedBox(
                          height: 0,
                        ),
                        Text(
                          message,
                          maxLines: 10,
                          style: GoogleFonts.inter(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: sendByMe
                                  ? Colors.white
                                  : Colors
                                      .black //const Color. fromRGBO(79, 79, 79, 1),
                              ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text(
            DateFormat.jm()
                .format(Timestamp.fromMillisecondsSinceEpoch(time).toDate()),
            style: TextStyle(color: Colors.black, fontSize: 10.sp),
          ),
        ),
      ],
    );
  }
}
