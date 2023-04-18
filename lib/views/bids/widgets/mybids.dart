import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class MyBids extends StatefulWidget {
  const MyBids({Key? key}) : super(key: key);

  @override
  State<MyBids> createState() => _MyBidsState();
}

class _MyBidsState extends State<MyBids> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchcontroller = TextEditingController();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: TextField(
                      controller: searchcontroller,
                      decoration: InputDecoration(
                        hintText: "Search Demand",
                        prefixIcon: true
                            ? IconButton(
                                icon: const Icon(Icons.arrow_back_ios),
                                onPressed: () {
                                  // setState(() {
                                  //   isSearching = false;
                                  // });
                                  // searchController.text = "";
                                },
                              )
                            : IconButton(
                                icon: const Icon(Icons.search),
                                onPressed: () {},
                              ),
                        border: InputBorder.none,
                      ),
                      onChanged: (s) {
                        // if (s.isNotEmpty) {
                        //   setState(() {
                        //     isSearching = true;
                        //   });
                        //   searchList = [];
                        // for (var element in items) {
                        //   if (element.entityName
                        //       .toLowerCase()
                        //       .contains(s.toLowerCase())) {
                        //     // searchList.add(element);
                        //   }
                        // }
                        // } else {
                        //   setState(() {
                        //     // isSearching = false;
                        //     // searchController.text = "";
                        //   });
                        // }
                        //result = json.where((o) => o['Product'] == searchController.text || o["Price"].toString() == searchController.text ).toList();
                      },
                    ),
                  ),
                ),
              ],
            )),
            SizedBox(
              width: 75,
              height: 60,
              child: ListTile(
                onTap: () {
                  showModalBottomSheet<void>(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    )),
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 50.h,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sort',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        // stapleDown = false;
                                        // stapleUp = false;
                                        // priceUp = false;
                                        // priceDown = !priceDown;
                                      });
                                      // items.sort((a, b) => a.askPrice
                                      //     .compareTo(b.askPrice));
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Price : High to low',
                                      style: TextStyle(
                                          color: true
                                              ? const Color(0xff219653)
                                              : const Color(0xff212121)
                                                  .withOpacity(0.8)),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor: true
                                            ? const Color(0xff219653)
                                                .withOpacity(0.2)
                                            : const Color(0xffE5E5E5)),
                                  ),
                                  // const SizedBox(width: 1,),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        // stapleDown = false;
                                        // stapleUp = false;
                                        // priceUp = !priceUp;
                                        // priceDown = false;
                                      });
                                      // items.sort((a, b) => b.askPrice
                                      //     .compareTo(a.askPrice));
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Price : Low to high',
                                      style: TextStyle(
                                          backgroundColor: true
                                              //stapleDown
                                              ? const Color(0xff219653)
                                              : const Color(0xff212121)
                                                  .withOpacity(0.8)),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor: true
                                            //stapleDown
                                            ? const Color(0xff219653)
                                                .withOpacity(0.2)
                                            : const Color(0xffE5E5E5)),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        // stapleDown = false;
                                        // stapleUp = !stapleUp;
                                        // priceUp = false;
                                        // priceDown = false;
                                      });
                                      // items.sort((a, b) =>
                                      //     a.avgUhml.compareTo(b.avgUhml));
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Staple :  Low to high',
                                      style: TextStyle(
                                          color: true
                                              //stapleDown
                                              ? const Color(0xff219653)
                                              : const Color(0xff212121)
                                                  .withOpacity(0.8)),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor: true
                                            //stapleDown
                                            ? const Color(0xff219653)
                                                .withOpacity(0.2)
                                            : const Color(0xffE5E5E5)),
                                  ),
                                  // const SizedBox(width: 1,),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        // stapleDown = !stapleDown;
                                        // stapleUp = false;
                                        // priceUp = false;
                                        // priceDown = false;
                                      });
                                      // items.sort((a, b) =>
                                      //     b.avgUhml.compareTo(a.avgUhml));
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Staple : High to low',
                                      style: TextStyle(
                                          color: true
                                              //stapleDown
                                              ? const Color(0xff219653)
                                              : const Color(0xff212121)
                                                  .withOpacity(0.8)),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor: true
                                            //stapleDown
                                            ? const Color(0xff219653)
                                                .withOpacity(0.2)
                                            : const Color(0xffE5E5E5)),
                                  ),
                                ],
                              ),
                              Text(
                                'Filter',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Terms',
                                style: TextStyle(fontSize: 13.sp),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        // stapleDown = !stapleDown;
                                        // stapleUp = false;
                                        // priceUp = false;
                                        // priceDown = false;
                                      });
                                      // json.sort((a, b) => a["Product"]
                                      //     .compareTo(b["Product"]));
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      '7 Days',
                                      style:
                                          TextStyle(color: Color(0xff219653)),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor: const Color(0xff219653)
                                            .withOpacity(0.2)),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        // stapleDown = false;
                                        // stapleUp = !stapleUp;
                                        // priceUp = false;
                                        // priceDown = false;
                                      });
                                      // json.sort((a, b) => b["Product"]
                                      //     .compareTo(a["Product"]));
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      '15 Days',
                                      style: TextStyle(
                                          color: const Color(0xff212121)
                                              .withOpacity(0.8)),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xffE5E5E5)),
                                  ),
                                ],
                              ),
                              Text(
                                'Variety',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        // stapleDown = !stapleDown;
                                        // stapleUp = false;
                                        // priceUp = false;
                                        // priceDown = false;
                                      });
                                      // json.sort((a, b) => a["Product"]
                                      //     .compareTo(b["Product"]));
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'DCH',
                                      style:
                                          TextStyle(color: Color(0xff219653)),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor: const Color(0xff219653)
                                            .withOpacity(0.2)),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        // stapleDown = false;
                                        // stapleUp = !stapleUp;
                                        // priceUp = false;
                                        // priceDown = false;
                                      });
                                      // json.sort((a, b) => b["Product"]
                                      //     .compareTo(a["Product"]));
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Shankar',
                                      style: TextStyle(
                                          color: const Color(0xff212121)
                                              .withOpacity(0.8)),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xffE5E5E5)),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        // stapleDown = false;
                                        // stapleUp = !stapleUp;
                                        // priceUp = false;
                                        // priceDown = false;
                                      });
                                      // json.sort((a, b) => b["Product"]
                                      //     .compareTo(a["Product"]));
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Bunny',
                                      style: TextStyle(
                                          color: const Color(0xff212121)
                                              .withOpacity(0.8)),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xffE5E5E5)),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        // stapleDown = false;
                                        // stapleUp = !stapleUp;
                                        // priceUp = false;
                                        // priceDown = false;
                                      });
                                      // json.sort((a, b) => b["Product"]
                                      //     .compareTo(a["Product"]));
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'TCGB 213',
                                      style: TextStyle(
                                          color: const Color(0xff212121)
                                              .withOpacity(0.8)),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xffE5E5E5)),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        // stapleDown = false;
                                        // stapleUp = !stapleUp;
                                        // priceUp = false;
                                        // priceDown = false;
                                      });
                                      // json.sort((a, b) => b["Product"]
                                      //     .compareTo(a["Product"]));
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'SVPR 2',
                                      style: TextStyle(
                                          color: const Color(0xff212121)
                                              .withOpacity(0.8)),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xffE5E5E5)),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        // stapleDown = false;
                                        // stapleUp = !stapleUp;
                                        // priceUp = false;
                                        // priceDown = false;
                                      });
                                      // json.sort((a, b) => b["Product"]
                                      //     .compareTo(a["Product"]));
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'SVPR 3',
                                      style: TextStyle(
                                          color: const Color(0xff212121)
                                              .withOpacity(0.8)),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xffE5E5E5)),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        // stapleDown = false;
                                        // stapleUp = !stapleUp;
                                        // priceUp = false;
                                        // priceDown = false;
                                      });
                                      // json.sort((a, b) => b["Product"]
                                      //     .compareTo(a["Product"]));
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'KC 2',
                                      style: TextStyle(
                                          color: const Color(0xff212121)
                                              .withOpacity(0.8)),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xffE5E5E5)),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        // stapleDown = false;
                                        // stapleUp = !stapleUp;
                                        // priceUp = false;
                                        // priceDown = false;
                                      });
                                      // json.sort((a, b) => b["Product"]
                                      //     .compareTo(a["Product"]));
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'SAURABHI',
                                      style: TextStyle(
                                          color: const Color(0xff212121)
                                              .withOpacity(0.8)),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xffE5E5E5)),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  'See more',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                      color: const Color(0xff27AE60)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                title: const Icon(Icons.filter_alt),
                subtitle: const Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text("Filter"),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("12 lots available"),
        ),
        Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 185,
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
                              ],
                            ),
                          ],
                        ),
                        color: Color(0xfff3fcfd),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "data",
                                    // ? searchList[index].entityName
                                    // : items[index].entityName,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Lot Number",
                                    // ? searchList[index].entityName
                                    // : items[index].entityName,
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                            Text(
                              "Rs. data",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    //
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
