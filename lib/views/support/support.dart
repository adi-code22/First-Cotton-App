import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text(
          "Support",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                color: Theme.of(context).primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "first cotton",
                        style: GoogleFonts.nunito(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Version " + _packageInfo.version,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 10,
              child: Container(
                color: Color(0xffF2F2F2),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          launch('tel:+919791902627');
                        });
                      },
                      child: ListTile(
                        title: Text(
                          "+91 97919 02627",
                          style: TextStyle(fontSize: 17),
                        ),
                        leading: CircleAvatar(
                          radius: 25.sp,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Icon(
                            Icons.call,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        //use below line for explecit declaration of subject and body
                        //launch("mailto:support@agridayco.com?subject=<subject>&body=<body>");
                        launch("mailto:support@agridayco.com");
                      },
                      child: ListTile(
                        title: Text(
                          "support@agridayco.com",
                          style: TextStyle(fontSize: 17),
                        ),
                        leading: CircleAvatar(
                          radius: 25.sp,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Icon(
                            Icons.mail,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
