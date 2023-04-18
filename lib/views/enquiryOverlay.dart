import 'package:first_cotton/views/chatscreen/widgets/contractConfirmation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class newDemandEnquiryWidget extends StatefulWidget {
  final int ind;
  const newDemandEnquiryWidget({
    Key? key,
    required this.ind,
  }) : super(key: key);

  @override
  State<newDemandEnquiryWidget> createState() => _newDemandEnquiryWidgetState();
}

class _newDemandEnquiryWidgetState extends State<newDemandEnquiryWidget> {
  TextEditingController searchController = TextEditingController();
  double sizes = 65.h;
  bool isMoreFilter = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Post New Enquiry',
                  style: GoogleFonts.inter(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
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
          SizedBox(
            height: sizes,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Variety",
                      style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
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
                              icon: Icon(Icons.keyboard_arrow_down_rounded,
                                  size: 30.sp),
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
                      "Quantity",
                      style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
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
                          child: TextField(
                            controller: searchController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 65.w,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(5)),
                                    color: Theme.of(context).shadowColor,
                                    border: Border.all(
                                        color: const Color(0xFF828282), width: 1.sp)),
                                height: 5.h,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "100",
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5)),
                                    color: Colors.grey[100],
                                    border: Border.all(
                                        color: const Color(0xFF828282), width: 1.sp)),
                                height: 5.h,
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
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5)),
                                    color: Colors.grey[100],
                                    border: Border.all(
                                        color: const Color(0xFF828282), width: 1.sp)),
                                height: 5.h,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "500",
                                    style: GoogleFonts.inter(
                                      color: const Color(0xFF828282),
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Delivery Date",
                      style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
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
                              icon: Icon(Icons.calendar_month, size: 20.sp),
                              value: "31 Dec 2021",
                              isExpanded: true,
                              items: <String>[
                                '31 Dec 2021',
                                '15 Days',
                                '30 Days',
                                '200'
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
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Staple",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black45,
                                ), //border of dropdown button
                                borderRadius: BorderRadius.circular(
                                    5), //border raiuds of dropdown button
                              ),
                              width: 45.w,
                              child: TextField(
                                controller: searchController,
                                decoration: InputDecoration(
                                  fillColor: Colors.grey[300],
                                  filled: true,
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "MIC",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black45,
                                ), //border of dropdown button
                                borderRadius: BorderRadius.circular(
                                    5), //border raiuds of dropdown button
                              ),
                              width: 45.w,
                              child: TextField(
                                controller: searchController,
                                decoration: InputDecoration(
                                  fillColor: Colors.grey[300],
                                  filled: true,
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                  isMoreFilter ?  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                        "Color",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                        SizedBox(
                          width: 100.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                flex:3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Rd",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,fontSize: 12.sp, color:const Color(0xff4F4F4F)),
                                    ),
                                    Container(margin: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black45,
                                        ), //border of dropdown button
                                        borderRadius: BorderRadius.circular(
                                            5), //border raiuds of dropdown button
                                      ),
                                      child: TextField(
                                        controller: searchController,
                                        decoration: InputDecoration(
                                          fillColor: Colors.grey[300],
                                          filled: true,
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),Expanded(
                                flex:3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "+b",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,fontSize: 12.sp, color:const Color(0xff4F4F4F)),
                                    ),
                                    Container(margin: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black45,
                                        ), //border of dropdown button
                                        borderRadius: BorderRadius.circular(
                                            5), //border raiuds of dropdown button
                                      ),
                                      child: TextField(
                                        controller: searchController,
                                        decoration: InputDecoration(
                                          fillColor: Colors.grey[300],
                                          filled: true,
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),Expanded(
                                flex:3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "CG",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,fontSize: 12.sp, color:const Color(0xff4F4F4F)),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black45,
                                        ), //border of dropdown button
                                        borderRadius: BorderRadius.circular(
                                            5), //border raiuds of dropdown button
                                      ),
                                      child: TextField(
                                        controller: searchController,
                                        decoration: InputDecoration(
                                          fillColor: Colors.grey[300],
                                          filled: true,
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "UI",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, color: Colors.black),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black45,
                                    ), //border of dropdown button
                                    borderRadius: BorderRadius.circular(
                                        5), //border raiuds of dropdown button
                                  ),
                                  width: 45.w,
                                  child: TextField(
                                    controller: searchController,
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey[300],
                                      filled: true,
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Strength",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, color: Colors.black),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black45,
                                    ), //border of dropdown button
                                    borderRadius: BorderRadius.circular(
                                        5), //border raiuds of dropdown button
                                  ),
                                  width: 45.w,
                                  child: TextField(
                                    controller: searchController,
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey[300],
                                      filled: true,
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Elong",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, color: Colors.black),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black45,
                                    ), //border of dropdown button
                                    borderRadius: BorderRadius.circular(
                                        5), //border raiuds of dropdown button
                                  ),
                                  width: 45.w,
                                  child: TextField(
                                    controller: searchController,
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey[300],
                                      filled: true,
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "SFI",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, color: Colors.black),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black45,
                                    ), //border of dropdown button
                                    borderRadius: BorderRadius.circular(
                                        5), //border raiuds of dropdown button
                                  ),
                                  width: 45.w,
                                  child: TextField(
                                    controller: searchController,
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey[300],
                                      filled: true,
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        const Text(
                          "Trash",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black45,
                            ), //border of dropdown button
                            borderRadius: BorderRadius.circular(
                                5), //border raiuds of dropdown button
                          ),
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              fillColor: Colors.grey[300],
                              filled: true,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ) : const SizedBox(),
                    ListTile(
                      onTap: (){
                      setState(() {
                        // sizes = 100.h;
                        isMoreFilter = !isMoreFilter;
                      });
                    },
                      title: Text( isMoreFilter ? "Less Filters" :"MoreFilters",textAlign: TextAlign.center,),
                      subtitle: Icon( isMoreFilter ? Icons.keyboard_arrow_up_outlined :Icons.keyboard_arrow_down_outlined),
                    ),

                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // showModalBottomSheet(
              //     shape: const RoundedRectangleBorder(
              //         borderRadius: BorderRadius.only(
              //       topLeft: Radius.circular(10),
              //       topRight: Radius.circular(10),
              //     )),
              //     isScrollControlled: true,
              //     context: context,
              //     builder: (BuildContext context) {
              //       return const contractConfirmation();
              //     });
            },
            child: Container(
              width: 100.w,
              decoration: BoxDecoration(
                  borderRadius:
                  const BorderRadius.all(Radius.circular(5)),
                  color: Theme.of(context).shadowColor,
                  border:
                  Border.all(color: Colors.green, width: 1.sp)),
              height: 8.h,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "CREATE ENQUIRY",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
