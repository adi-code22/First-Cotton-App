import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
class PlaceBidOverlay extends StatefulWidget {
  const PlaceBidOverlay({Key? key}) : super(key: key);

  @override
  State<PlaceBidOverlay> createState() => _PlaceBidOverlayState();
}

class _PlaceBidOverlayState extends State<PlaceBidOverlay> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   return SizedBox(
     // height: sizes,
     child: Column(

       children: [
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 16.27),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
             const SizedBox(height: 26,),
             Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                 'Place Bid',
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
             const SizedBox(
               height: 35,
             ),
             Text(
               "Choose Lot",
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
                         '24156-GGV-Mills-100Bales',
                         '24156-ssd-Mills-100Bales',
                         '24156-ass-Mills-100Bales'
                       ].map<DropdownMenuItem<String>>((String value) {
                         return DropdownMenuItem<String>(
                           value: value,
                           child: Text(value),
                         );
                       }).toList(),
                       onChanged: (String? values) {
                         // value = values;
                       },
                     ),
                   ),
                 ),
               ),
             ),
             const SizedBox(
               height: 15,
             ),
             Text(
               "Bid Price",
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
                     decoration: InputDecoration(
                       border: InputBorder.none,
                     ),
                   ),
                 ),
               ),
             ),],),
         ),
         const SizedBox(height: 50,),


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
           child: Row(
             children: [
               Expanded(
                 child: Container(
                   width: 100.w,
                   decoration: BoxDecoration(
                       borderRadius:
                       const BorderRadius.all(Radius.circular(5)),
                       color: Theme.of(context).shadowColor,
                       border:
                       Border.all(color:  const Color(0xFF2D9CDB), width: 1.sp)),
                   height: 8.h,
                   child: Align(
                     alignment: Alignment.center,
                     child: Text(
                       "PLACE BID",
                       style: GoogleFonts.inter(
                         color: Colors.white,
                         fontSize: 14.sp,
                       ),
                     ),
                   ),
                 ),
               ),
             ],
           ),
         )
       ],
     ),
   );
  }


}
