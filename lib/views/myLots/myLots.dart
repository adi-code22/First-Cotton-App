import 'package:first_cotton/services/api/my_lots_new.dart';
import 'package:first_cotton/services/local/sharedPreferences.dart';
import 'package:first_cotton/views/lotdetailspage/lotdetailspage.dart';
import 'package:first_cotton/views/myLots/widgets/myLotsCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../../services/local/sharedPreferences.dart';

class MyLots extends StatefulWidget {
  const MyLots({Key? key}) : super(key: key);

  @override
  State<MyLots> createState() => _MyLotsState();
}

List myLots = [];
List result = [];
String token = '';

class _MyLotsState extends State<MyLots> {
  TextEditingController searchController = TextEditingController();
  bool nameUp = true;
  bool nameDown = false;
  bool priceUp = false;
  bool priceDown = false;
  bool isSearching = false;

//In Stock Text Widget
  Widget inStock = Text(
    '  IN STOCK  ',
    style: GoogleFonts.inter(fontSize: 10.sp, color: Color(0xff2F80ED)),
  );

//In Stock Text Widget
  Widget sold = Text(
    '  SOLD  ',
    style: GoogleFonts.inter(fontSize: 10.sp, color: Color(0xff27AE60)),
  );

//In Stock Text Widget
  Widget soldPrivate = Text(
    '  SOLD PRIVATE  ',
    style: GoogleFonts.inter(fontSize: 10.sp, color: Color(0xffF2994A)),
  );

  getData() async {
    // String? token =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtb2JpbGVOdW1iZXIiOiI5ODYxMDEzMzk5IiwiaWF0IjoxNjUwMjA2Njg2LCJleHAiOjE2NTc5ODI2ODZ9.KRMy_X6YDwZ38p60fugVIGAvSWLn5CIs_dIuY43a-m4";
    String? token = await SharedPrefs().getToken();
    http.Response response = await http.get(
      Uri.https("beta.firstcotton.app", "api/user/v/my/lots"),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token'
      },
    );
    MyLotsApi data = MyLotsApi.fromJson(convert.jsonDecode(response.body));
    if (response.statusCode == 200) {
      myLots = data.data!.lotsResult!;
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xffEDEDED),
      appBar: AppBar(
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
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "My Lots",
          style: TextStyle(fontSize: 20.sp, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Card(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: "Search Lots",
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
                              result = [];
                              for (var element in myLots) {
                                if (element.lotNumber.toString().contains(s)) {
                                  result.add(element);
                                }
                              }
                            } else if (s.isEmpty) {
                              setState(() {
                                isSearching = false;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 75,
                    height: 60,
                    child: ListTile(
                      onTap: () {
                        showModalBottomSheet<void>(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          )),
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: 50.h,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                                              nameUp = !nameUp;
                                              nameDown = false;
                                              priceUp = false;
                                              priceDown = false;
                                            });
                                            // json.sort((a, b) => a["Product"]
                                            //     .compareTo(b["Product"]));
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'Price : High to low',
                                            style: TextStyle(
                                                color: Color(0xff219653)),
                                          ),
                                          style: TextButton.styleFrom(
                                              backgroundColor: Color(0xff219653)
                                                  .withOpacity(0.2)),
                                        ),
                                        // const SizedBox(width: 1,),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              nameUp = false;
                                              nameDown = !nameDown;
                                              priceUp = false;
                                              priceDown = false;
                                            });
                                            // json.sort((a, b) => b["Product"]
                                            //     .compareTo(a["Product"]));
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Price : Low to high',
                                            style: TextStyle(
                                                color: Color(0xff212121)
                                                    .withOpacity(0.8)),
                                          ),
                                          style: TextButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xffE5E5E5)),
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
                                              nameUp = !nameUp;
                                              nameDown = false;
                                              priceUp = false;
                                              priceDown = false;
                                            });
                                            // json.sort((a, b) => a["Product"]
                                            //     .compareTo(b["Product"]));
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            '7 Days',
                                            style: TextStyle(
                                                color: Color(0xff219653)),
                                          ),
                                          style: TextButton.styleFrom(
                                              backgroundColor: Color(0xff219653)
                                                  .withOpacity(0.2)),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              nameUp = false;
                                              nameDown = !nameDown;
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
                                                color: Color(0xff212121)
                                                    .withOpacity(0.8)),
                                          ),
                                          style: TextButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xffE5E5E5)),
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
                                              nameUp = !nameUp;
                                              nameDown = false;
                                              priceUp = false;
                                              priceDown = false;
                                            });
                                            // json.sort((a, b) => a["Product"]
                                            //     .compareTo(b["Product"]));
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'DCH',
                                            style: TextStyle(
                                                color: Color(0xff219653)),
                                          ),
                                          style: TextButton.styleFrom(
                                              backgroundColor: Color(0xff219653)
                                                  .withOpacity(0.2)),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              nameUp = false;
                                              nameDown = !nameDown;
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
                                                color: Color(0xff212121)
                                                    .withOpacity(0.8)),
                                          ),
                                          style: TextButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xffE5E5E5)),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              nameUp = false;
                                              nameDown = !nameDown;
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
                                                color: Color(0xff212121)
                                                    .withOpacity(0.8)),
                                          ),
                                          style: TextButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xffE5E5E5)),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              nameUp = false;
                                              nameDown = !nameDown;
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
                                                color: Color(0xff212121)
                                                    .withOpacity(0.8)),
                                          ),
                                          style: TextButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xffE5E5E5)),
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
                                              nameUp = false;
                                              nameDown = !nameDown;
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
                                                color: Color(0xff212121)
                                                    .withOpacity(0.8)),
                                          ),
                                          style: TextButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xffE5E5E5)),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              nameUp = false;
                                              nameDown = !nameDown;
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
                                                color: Color(0xff212121)
                                                    .withOpacity(0.8)),
                                          ),
                                          style: TextButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xffE5E5E5)),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              nameUp = false;
                                              nameDown = !nameDown;
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
                                                color: Color(0xff212121)
                                                    .withOpacity(0.8)),
                                          ),
                                          style: TextButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xffE5E5E5)),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              nameUp = false;
                                              nameDown = !nameDown;
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
                                                color: Color(0xff212121)
                                                    .withOpacity(0.8)),
                                          ),
                                          style: TextButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xffE5E5E5)),
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
                                            color: Color(0xff27AE60)),
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
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: const Text("Filter"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: size.width,
                height: 78.h,
                child: ListView.builder(
                    // reverse: nameDown,
                    itemCount: isSearching ? result.length : myLots.length,
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((BuildContext context) =>
                                      LotDetailsPage(
                                        index: index,
                                        myLot: isSearching ? result : myLots,
                                        isSearching: isSearching,
                                      ))));
                        },
                        child: myLotsCard(
                            size, index, isSearching, result, myLots, 0),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
