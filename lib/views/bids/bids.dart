import 'package:first_cotton/views/bids/widgets/mybids.dart';
import 'package:first_cotton/views/bids/widgets/mydemand.dart';
import 'package:flutter/material.dart';

class BidsHome extends StatefulWidget {
  const BidsHome({Key? key}) : super(key: key);

  @override
  State<BidsHome> createState() => _BidsHomeState();
}

class _BidsHomeState extends State<BidsHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: TabBar(
              indicatorColor: Theme.of(context).shadowColor,
              tabs: [
                Tab(
                  child: Text(
                    "My Bids",
                    style: TextStyle(color: Theme.of(context).shadowColor),
                  ),
                ),
                Tab(
                    child: Text(
                  "My Demand",
                  style: TextStyle(color: Theme.of(context).shadowColor),
                ))
              ],
            ),
          ),
          body: const TabBarView(children: [
            MyBids(),
            MyDemand(),
          ]),
        ));
  }
}
