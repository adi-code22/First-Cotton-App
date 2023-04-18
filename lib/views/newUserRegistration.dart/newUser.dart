import 'package:first_cotton/helpers/flutterToast.dart';
import 'package:first_cotton/services/local/sharedPreferences.dart';
import 'package:first_cotton/views/newUserRegistration.dart/acknowledgement.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../view_models/registerUser.dart';
import '../bottomNavigation.dart';

class NewUser extends StatefulWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  TextEditingController nameController = TextEditingController();
  TextEditingController businessController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 16.h,
              ),
              Text('first cotton',
                  style: GoogleFonts.nunito(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    color: const Color(0xff27AE60),
                  )),
              SizedBox(
                height: 1.h,
              ),
              Text('Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: Colors.grey,
                  )),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey)),
                child: TextField(
                  textInputAction: TextInputAction.go,
                  controller: nameController,
                  style: TextStyle(fontSize: 20.sp),
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      counterText: '', border: InputBorder.none),
                  onSubmitted: (s){
                    // print(s);
                    // if (s.length == 10 && s.isNotEmpty) {
                    //   setState(() {
                    //     loading = true;
                    //   });
                    //   sendOTP();
                    // } else {
                    //   setState(() {
                    //     loading = false;
                    //     numberCheck = true;
                    //   });
                    // }
                  },
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text('Email',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  )),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey)),
                child: TextField(
                  textInputAction: TextInputAction.go,
                  controller: emailController,
                  style: TextStyle(fontSize: 20.sp),
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      counterText: '', border: InputBorder.none),
                  onSubmitted: (s) {
                    // print(s);
                    // if (s.length == 10 && s.isNotEmpty) {
                    //   setState(() {
                    //     loading = true;
                    //   });
                    //   sendOTP();
                    // } else {
                    //   setState(() {
                    //     loading = false;
                    //     numberCheck = true;
                    //   });
                    // }
                  },
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text('Business Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: Colors.grey,
                  )),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey)),
                child: TextField(
                  textInputAction: TextInputAction.go,
                  controller: businessController,
                  style: TextStyle(fontSize: 20.sp),
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      counterText: '', border: InputBorder.none),
                  onSubmitted: (s) {
                    // print(s);
                    // if (s.length == 10 && s.isNotEmpty) {
                    //   setState(() {
                    //     loading = true;
                    //   });
                    //   sendOTP();
                    // } else {
                    //   setState(() {
                    //     loading = false;
                    //     numberCheck = true;
                    //   });
                    // }
                  },
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text('GST',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: Colors.grey,
                  )),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey)),
                child: TextField(
                  textInputAction: TextInputAction.go,
                  controller: gstController,
                  style: TextStyle(fontSize: 20.sp),
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      counterText: '', border: InputBorder.none),
                  onSubmitted: (s) {
                    // print(s);
                    // if (s.length == 10 && s.isNotEmpty) {
                    //   setState(() {
                    //     loading = true;
                    //   });
                    //   sendOTP();
                    // } else {
                    //   setState(() {
                    //     loading = false;
                    //     numberCheck = true;
                    //   });
                    // }
                  },
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              GestureDetector(
                onTap: () async{
                  if(nameController.text != '' && emailController.text != '' &&
                      businessController.text !=  "" && gstController.text != ''){
                    setState((){
                      loading = true;
                    });
               bool boll =    await  registerUserToDb(nameController.text, emailController.text,
                      businessController.text, gstController.text);
                    setState((){
                      loading = false;
                    });
               if(boll){
                 if(!mounted)return;
                 Navigator.pushReplacement(
                     context,
                     MaterialPageRoute(
                       builder: (context) => const BottomNavigation(),
                     ));
               }else{
                 print('object');
               }
                  }
                  else{
                    Helpers().showToast("Please Fill all the details");
                  }

                },
                child: Container(
                  alignment: Alignment.center,
                  height: 51,
                  decoration: BoxDecoration(
                    color: const Color(0xff35935C),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: loading  ? const CircularProgressIndicator() :Text(
                  "CREATE ACCOUNT",
                  style:
                  GoogleFonts.inter(fontSize: 14.sp, color: Colors.white),
                ),
                ),
              ),
            ],
          ),
        ),
      )),
      floatingActionButton:FloatingActionButton(onPressed: ()async{
        String? some =await SharedPrefs().getUserId();
        print(some);
      } ),
    );
  }
}
