import 'package:first_cotton/helpers/theme.dart';
import 'package:first_cotton/services/api/dashboardApi.dart';
import 'package:first_cotton/services/local/sharedPreferences.dart';
import 'package:first_cotton/view_models/dashboard_api.dart';
import 'package:first_cotton/views/dashboard/widgets/bottomSmallCard.dart';
import 'package:first_cotton/views/dashboard/widgets/priceList.dart';
import 'package:first_cotton/views/dashboard/widgets/topSmallCard.dart';
import 'package:first_cotton/views/dashboard/widgets/topSmallCard2.dart';
import 'package:first_cotton/views/market/market.dart';
import 'package:first_cotton/views/notification/notification.dart' as notif;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

String userNumber = '';
int len = 0;
String userName = '';
String userId = '';
String userEmail = '';
String time = '';

class _DashboardState extends State<Dashboard> {
  var timeFormat = DateFormat("hh:mm aaa  EEE, MMM d");
  Data? items;
  List prices = [];
  get() async {
    items = await dashboardData();
    prices = items!.prices!;
    userNumber = (await SharedPrefs().getUserNumber())!;
    userName = (await SharedPrefs().getUserName())!;
    userId = (await SharedPrefs().getUserId())!;
    userEmail = (await SharedPrefs().getUserEmail())!;
    setState(() {});
  }

  @override
  void initState() {
    get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    items != null ? len = items!.prices!.length : len = 0;

    reqTime().then((result) {
      setState(() {
        time = result!;
      });
    });
    List<Row> _myWidget(int count) {
      return List.generate(
        count,
        (i) => Row(
          children: [
            Icon(
              Icons.circle,
              color: Theme.of(context).primaryColor,
              size: 10,
            ),
            SizedBox(
              width: 2.w,
            )
          ],
        ),
      ).toList(); // replace * with your rupee or use Icon instead
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Dashboard',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: [
          IconButton(
              onPressed: () async {
                String? token = await SharedPrefs().getToken();
                print(token);
                if(!mounted)return;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          // Something()
                          notif.Notification(),
                    ));
              },
              icon: const Icon(
                Icons.notifications,
                color: Color(0xff828282),
              ))
        ],
      ),
      //body
      body: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  children: [
                    //bales Available
                    topSmallCard(context, items),
                    //participants
                    topSmallCard2(context, items),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                color: const Color(0xfff2f2f2),
                width: 100.w,
                height:
                    items != null ? (32 + items!.prices!.length * 2).h : 32.h,
                constraints: BoxConstraints(minHeight: 29.h, maxHeight: 80.h),
                child: ListView.builder(
                    itemCount: items != null ? items!.prices!.length : 2,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return Row(
                        children: [
                          priceList(index, context, items, prices, time),
                          const SizedBox(
                            width: 4,
                          ),
                        ],
                      );
                    }),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _myWidget(len)),
              const SizedBox(
                height: 18,
              ),
              bottomSmallCard(context, items),
            ],
          ),
        ),
      ),
    );
  }
}
