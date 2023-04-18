import 'package:first_cotton/helpers/theme.dart';
import 'package:first_cotton/views/bids/bids.dart';
import 'package:first_cotton/views/chat/chat.dart';
import 'package:first_cotton/views/dashboard/dashboard.dart';
import 'package:first_cotton/views/market/market.dart';
import 'package:first_cotton/views/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    Dashboard(),
    Market(),
    BidsHome(),
    Chat(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 6,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: CustomTheme.lightTheme.primaryColor,
        unselectedItemColor: const Color(0xFFCCCCCC),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Buy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.back_hand_rounded),
            label: 'Bids',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.text_bubble),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: 'Profile',
          ),
        ],
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
    );
  }
}
