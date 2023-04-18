import 'package:first_cotton/services/api/Entity.dart';
import 'package:first_cotton/view_models/entityCall.dart';
import 'package:first_cotton/views/myprofile/widgets/myProfileTab.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../dashboard/dashboard.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  EntityResponse? data;
  get() async {
    print(userId);
    data = await entityData(userId);
    setState(() {});
  }

  @override
  void initState() {
    get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffcfcfc),
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
        automaticallyImplyLeading: true,
        title: const Text(
          "My Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 92.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myProfileTab("Name", userName),
                    myProfileTab("Phone", userNumber, Colors.grey),
                    myProfileTab("Name", userEmail),
                    SizedBox(
                      height: 1.h,
                    )
                  ],
                ),
              ),
              Container(
                color: const Color(0xffE0E0E0),
                height: 1.h,
              ),
              data != null
                  ? SizedBox(
                      width: 92.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "Entity Details",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp,
                                color: Colors.black),
                          ),
                          myProfileTab("Name", data!.data!.first.name!),
                          myProfileTab("GST", data!.data!.first.gst!),
                          myProfileTab("Phone", data!.data!.first.owner!.phone!),
                          // myProfileTab("Station", data!.data!.first.station!),
                          // myProfileTab("Address", data!.data!.first.address!),
                          SizedBox(
                            height: 3.h,
                          ),
                        ],
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
