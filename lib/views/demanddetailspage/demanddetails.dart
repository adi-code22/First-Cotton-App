import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../lotdetailspage/widgets/updown.dart';

class DemandDetails extends StatefulWidget {
  const DemandDetails({Key? key}) : super(key: key);

  @override
  State<DemandDetails> createState() => _DemandDetailsState();
}

class _DemandDetailsState extends State<DemandDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 7.w,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Demand Details",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: 120,
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
                                        "data",
                                        // ? searchList[index].entityName
                                        // : items[index].entityName,
                                        style: TextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                // Align(
                                //     alignment: Alignment.centerRight,
                                //     child: Padding(
                                //       padding: const EdgeInsets.all(16.0),
                                //       child: Text(
                                //         double.tryParse(isSearching
                                //                     ? searchList[index]
                                //                         .askPrice
                                //                         .toString()
                                //                     : items[index]
                                //                         .askPrice
                                //                         .toString()) !=
                                //                 null
                                //             ? format.format(num.parse(
                                //                 isSearching
                                //                     ? searchList[index]
                                //                         .askPrice
                                //                         .toString()
                                //                     : items[index]
                                //                         .askPrice
                                //                         .toString()))
                                //             : '-',
                                //         style: TextStyle(
                                //             fontSize: 18,
                                //             color: Theme.of(context)
                                //                 .primaryColor,
                                //             fontWeight: FontWeight.bold),
                                //       ),
                                //     )),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "data" + " mm",
                                            style: GoogleFonts.inter(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "Staple",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10.sp),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "100" + " Bales",
                                            style: GoogleFonts.inter(
                                                fontSize: 14.sp,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "Quantity",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10.sp),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "7" + " Days",
                                            style: GoogleFonts.inter(
                                                fontSize: 14.sp,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "Terms",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10.sp),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "20",
                                            style: GoogleFonts.inter(
                                                fontSize: 14.sp,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Bids",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            color: Color(0xfff3fcfd),
                          ),
                        ),

                        //
                      ],
                    ),
                  ),
                )),
            Container(
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
                                'Quality Requirements',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
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
                              updown(varr: "Staple", val: "data"),
                              updown(varr: "UI", val: "data".toString()),
                              updown(varr: "MIC", val: "data"),
                              updown(varr: "gTex", val: "data"),
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
                              updown(varr: "Rd", val: "data"),
                              updown(varr: "+b", val: "data"),
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
                              updown(varr: "Elong", val: "data"),
                              updown(varr: "SFI", val: "data"),
                              updown(varr: "Trash", val: "data"),
                              const updown(varr: "", val: '')
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Container(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "CHANGE STATUS",
                            style: GoogleFonts.inter(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 1.sp)),
                        height: 7.h,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Container(
                        child: Align(
                          alignment: Alignment.center,
                          child: false
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  "CERTIFICATE",
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                  ),
                                ),
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 1.sp),
                        ),
                        height: 7.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Bids (8)",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 22.sp,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Arun Jayaramakrishnan",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    CircleAvatar(
                      radius: 10.sp,
                      child: Text("10"),
                      backgroundColor: Theme.of(context).primaryColor,
                    )
                  ],
                ),
                subtitle: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 3.h,
                        color: Colors.grey[400],
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(" 100 Bales ",
                              style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 3.h,
                        color: Colors.grey[400],
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            " 29.5mm ",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          " Rs. 99,000 ",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
