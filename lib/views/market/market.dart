import 'dart:async';
import 'package:first_cotton/helpers/theme.dart';
import 'package:first_cotton/services/api/market_screen.dart';
import 'package:first_cotton/views/enquiryOverlay.dart';
import 'package:first_cotton/views/market/widgets/cardBody.dart';
import 'package:first_cotton/views/market/widgets/demandDetails.dart';
import 'package:first_cotton/views/market/widgets/myBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../../services/local/sharedPreferences.dart';

class Market extends StatefulWidget {
  const Market({Key? key}) : super(key: key);

  @override
  State<Market> createState() => _MarketState();
}

Timer? timer;

List items = [];
List searchList = [];

class _MarketState extends State<Market> {
  TextEditingController searchController = TextEditingController();
  bool stapleDown = true;
  bool stapleUp = false;
  bool priceUp = false;
  bool priceDown = false;
  bool isSearching = false;

  getData() async {
    String? token = await SharedPrefs().getToken();
    http.Response response = await http.get(
      Uri.https("beta.firstcotton.app", "api/user/v/market/lots"),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token'
      },
    );
    MarketLots data = MarketLots.fromJson(convert.jsonDecode(response.body));

    if (response.statusCode == 200) {
      items = data.data!.lotsResult!;
      setState(() {});
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  var format =
      NumberFormat.currency(locale: 'hi_IN', decimalDigits: 0, symbol: "₹");
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: TabBar(
              indicatorColor: Theme.of(context).primaryColor,
              tabs: [
                Tab(
                  child: Text(
                    "Supply",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
                Tab(
                  child: Text(
                    "Demand",
                    style: TextStyle(color: Theme.of(context).shadowColor),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [market(context), demand(context)]),
        ),
      ),
    );
  }

  Column demand(BuildContext context) {
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
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Search Market",
                        prefixIcon: isSearching
                            ? IconButton(
                                icon: const Icon(Icons.arrow_back_ios),
                                onPressed: () {
                                  setState(() {
                                    isSearching = false;
                                  });
                                  searchController.text = "";
                                },
                              )
                            : IconButton(
                                icon: const Icon(Icons.search),
                                onPressed: () {},
                              ),
                        border: InputBorder.none,
                      ),
                      onChanged: (s) {
                        if (s.isNotEmpty) {
                          setState(() {
                            isSearching = true;
                          });
                          searchList = [];
                          for (var element in items) {
                            if (element.entityName
                                .toLowerCase()
                                .contains(s.toLowerCase())) {
                              searchList.add(element);
                            }
                          }
                        } else {
                          setState(() {
                            isSearching = false;
                            searchController.text = "";
                          });
                        }
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
                                        stapleDown = false;
                                        stapleUp = false;
                                        priceUp = false;
                                        priceDown = !priceDown;
                                      });
                                      // items.sort((a, b) => a.askPrice
                                      //     .compareTo(b.askPrice));
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Price : High to low',
                                      style: TextStyle(
                                          color: priceDown
                                              ? const Color(0xff219653)
                                              : const Color(0xff212121)
                                                  .withOpacity(0.8)),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor: priceDown
                                            ? const Color(0xff219653)
                                                .withOpacity(0.2)
                                            : const Color(0xffE5E5E5)),
                                  ),
                                  // const SizedBox(width: 1,),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        stapleDown = false;
                                        stapleUp = false;
                                        priceUp = !priceUp;
                                        priceDown = false;
                                      });
                                      // items.sort((a, b) => b.askPrice
                                      //     .compareTo(a.askPrice));
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Price : Low to high',
                                      style: TextStyle(
                                          color: priceUp
                                              ? const Color(0xff219653)
                                              : const Color(0xff212121)
                                                  .withOpacity(0.8)),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor: priceUp
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
                                        stapleDown = false;
                                        stapleUp = !stapleUp;
                                        priceUp = false;
                                        priceDown = false;
                                      });
                                      items.sort((a, b) =>
                                          a.avgUhml.compareTo(b.avgUhml));
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Staple :  Low to high',
                                      style: TextStyle(
                                          color: stapleUp
                                              ? const Color(0xff219653)
                                              : const Color(0xff212121)
                                                  .withOpacity(0.8)),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor: stapleUp
                                            ? const Color(0xff219653)
                                                .withOpacity(0.2)
                                            : const Color(0xffE5E5E5)),
                                  ),
                                  // const SizedBox(width: 1,),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        stapleDown = !stapleDown;
                                        stapleUp = false;
                                        priceUp = false;
                                        priceDown = false;
                                      });
                                      items.sort((a, b) =>
                                          b.avgUhml.compareTo(a.avgUhml));
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Staple : High to low',
                                      style: TextStyle(
                                          color: stapleDown
                                              ? const Color(0xff219653)
                                              : const Color(0xff212121)
                                                  .withOpacity(0.8)),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor: stapleDown
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
                                        stapleDown = !stapleDown;
                                        stapleUp = false;
                                        priceUp = false;
                                        priceDown = false;
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
                                        stapleDown = false;
                                        stapleUp = !stapleUp;
                                        priceUp = false;
                                        priceDown = false;
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
                                        stapleDown = !stapleDown;
                                        stapleUp = false;
                                        priceUp = false;
                                        priceDown = false;
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
                                        stapleDown = false;
                                        stapleUp = !stapleUp;
                                        priceUp = false;
                                        priceDown = false;
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
                                        stapleDown = false;
                                        stapleUp = !stapleUp;
                                        priceUp = false;
                                        priceDown = false;
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
                                        stapleDown = false;
                                        stapleUp = !stapleUp;
                                        priceUp = false;
                                        priceDown = false;
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
                                        stapleDown = false;
                                        stapleUp = !stapleUp;
                                        priceUp = false;
                                        priceDown = false;
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
                                        stapleDown = false;
                                        stapleUp = !stapleUp;
                                        priceUp = false;
                                        priceDown = false;
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
                                        stapleDown = false;
                                        stapleUp = !stapleUp;
                                        priceUp = false;
                                        priceDown = false;
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
                                        stapleDown = false;
                                        stapleUp = !stapleUp;
                                        priceUp = false;
                                        priceDown = false;
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
        Expanded(
          child: ListView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              // shrinkWrap: true,
              itemCount: isSearching ? searchList.length : items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    lotDemandDetailsOverlay(index);
                  },
                  child: Padding(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text(
                                              isSearching
                                                  ? searchList[index].entityName
                                                  : items[index].entityName,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  items[index]
                                                          .avgUhml
                                                          .toString() +
                                                      "mm",
                                                  style: GoogleFonts.inter(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                        ],
                                      ),
                                    ],
                                  ),
                                  color: Color.fromARGB(255, 159, 235, 245),
                                ),
                              ),
                              //
                            ],
                          ),
                        ),
                      )),
                );
              }),
        )
      ],
    );
  }

  Column market(BuildContext context) {
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
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Search Market",
                        prefixIcon: isSearching
                            ? IconButton(
                                icon: const Icon(Icons.arrow_back_ios),
                                onPressed: () {
                                  setState(() {
                                    isSearching = false;
                                  });
                                  searchController.text = "";
                                },
                              )
                            : IconButton(
                                icon: const Icon(Icons.search),
                                onPressed: () {},
                              ),
                        border: InputBorder.none,
                      ),
                      onChanged: (s) {
                        if (s.isNotEmpty) {
                          setState(() {
                            isSearching = true;
                          });
                          searchList = [];
                          for (var element in items) {
                            if (element.entityName
                                .toLowerCase()
                                .contains(s.toLowerCase())) {
                              searchList.add(element);
                            }
                          }
                        } else {
                          setState(() {
                            isSearching = false;
                            searchController.text = "";
                          });
                        }
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
                                        stapleDown = false;
                                        stapleUp = false;
                                        priceUp = false;
                                        priceDown = !priceDown;
                                      });
                                      // items.sort((a, b) => a.askPrice
                                      //     .compareTo(b.askPrice));
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Price : High to low',
                                      style: TextStyle(
                                          color: priceDown
                                              ? const Color(0xff219653)
                                              : const Color(0xff212121)
                                                  .withOpacity(0.8)),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor: priceDown
                                            ? const Color(0xff219653)
                                                .withOpacity(0.2)
                                            : const Color(0xffE5E5E5)),
                                  ),
                                  // const SizedBox(width: 1,),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        stapleDown = false;
                                        stapleUp = false;
                                        priceUp = !priceUp;
                                        priceDown = false;
                                      });
                                      // items.sort((a, b) => b.askPrice
                                      //     .compareTo(a.askPrice));
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Price : Low to high',
                                      style: TextStyle(
                                          color: priceUp
                                              ? const Color(0xff219653)
                                              : const Color(0xff212121)
                                                  .withOpacity(0.8)),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor: priceUp
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
                                        stapleDown = false;
                                        stapleUp = !stapleUp;
                                        priceUp = false;
                                        priceDown = false;
                                      });
                                      items.sort((a, b) =>
                                          a.avgUhml.compareTo(b.avgUhml));
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Staple :  Low to high',
                                      style: TextStyle(
                                          color: stapleUp
                                              ? const Color(0xff219653)
                                              : const Color(0xff212121)
                                                  .withOpacity(0.8)),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor: stapleUp
                                            ? const Color(0xff219653)
                                                .withOpacity(0.2)
                                            : const Color(0xffE5E5E5)),
                                  ),
                                  // const SizedBox(width: 1,),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        stapleDown = !stapleDown;
                                        stapleUp = false;
                                        priceUp = false;
                                        priceDown = false;
                                      });
                                      items.sort((a, b) =>
                                          b.avgUhml.compareTo(a.avgUhml));
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Staple : High to low',
                                      style: TextStyle(
                                          color: stapleDown
                                              ? const Color(0xff219653)
                                              : const Color(0xff212121)
                                                  .withOpacity(0.8)),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor: stapleDown
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
                                        stapleDown = !stapleDown;
                                        stapleUp = false;
                                        priceUp = false;
                                        priceDown = false;
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
                                        stapleDown = false;
                                        stapleUp = !stapleUp;
                                        priceUp = false;
                                        priceDown = false;
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
                                        stapleDown = !stapleDown;
                                        stapleUp = false;
                                        priceUp = false;
                                        priceDown = false;
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
                                        stapleDown = false;
                                        stapleUp = !stapleUp;
                                        priceUp = false;
                                        priceDown = false;
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
                                        stapleDown = false;
                                        stapleUp = !stapleUp;
                                        priceUp = false;
                                        priceDown = false;
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
                                        stapleDown = false;
                                        stapleUp = !stapleUp;
                                        priceUp = false;
                                        priceDown = false;
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
                                        stapleDown = false;
                                        stapleUp = !stapleUp;
                                        priceUp = false;
                                        priceDown = false;
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
                                        stapleDown = false;
                                        stapleUp = !stapleUp;
                                        priceUp = false;
                                        priceDown = false;
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
                                        stapleDown = false;
                                        stapleUp = !stapleUp;
                                        priceUp = false;
                                        priceDown = false;
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
                                        stapleDown = false;
                                        stapleUp = !stapleUp;
                                        priceUp = false;
                                        priceDown = false;
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

        // after filter
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(isSearching
                    ? searchList.length.toString()
                    : items.length.toString() + " Lots Available"))),
        Expanded(
          child: ListView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              // shrinkWrap: true,
              itemCount: isSearching ? searchList.length : items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    lotDetailsOverlay(index);
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          height: 180,
                          child: Column(
                            children: [
                              //cardHeading(index),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text(
                                              isSearching
                                                  ? searchList[index].entityName
                                                  : items[index].entityName,
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text(
                                              double.tryParse(isSearching
                                                          ? searchList[index]
                                                              .askPrice
                                                              .toString()
                                                          : items[index]
                                                              .askPrice
                                                              .toString()) !=
                                                      null
                                                  ? format.format(num.parse(
                                                      isSearching
                                                          ? searchList[index]
                                                              .askPrice
                                                              .toString()
                                                          : items[index]
                                                              .askPrice
                                                              .toString()))
                                                  : '-',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              marketCard(index, context,
                                  isSearching ? searchList : items),
                            ],
                          ),
                        ),
                      )),
                );
              }),
        )
      ],
    );
  }

  lotDetailsOverlay(int index) {
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(5),
        topRight: Radius.circular(5),
      )),
      context: context,
      builder: (BuildContext context) {
        return MyBottomSheet(
            index: index,
            data: isSearching ? searchList : items); // Pass the data here
      },
    );
  }

  lotDemandDetailsOverlay(int index) {
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      )),
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              // DemandBottomSheet(index: 0,data: items,),
              newDemandEnquiryWidget(
                ind: index,
              ),
            ],
          ),
        );
      },
    );
  }

  placeBidOverlay(int index) {
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      )),
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              DemandBottomSheet(
                index: 0,
                data: items,
              ),
              // newDemandEnquiryWidget(
              //   ind: index,
              // ),
            ],
          ),
        );
      },
    );
  }
}

// class cardHeading extends StatefulWidget {
//   cardHeading(
//     int index,
//     //List items,
//     {
//     Key? key,
//   }) : super(key: key);
//   int index = 0;
//   @override
//   State<cardHeading> createState() => _cardHeadingState();
// }

// class _cardHeadingState extends State<cardHeading> {
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       flex: 2,
//       child: Container(
//         color: Colors.white,
//         child: Align(
//             alignment: Alignment.centerLeft,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 items[widget.index].entityName,
//                 style: const TextStyle(fontSize: 15),
//               ),
//             )),
//       ),
//     );
//   }
// }
