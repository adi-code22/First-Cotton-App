import 'dart:async';
import 'dart:convert';
import 'package:first_cotton/helpers/flutterToast.dart';
import 'package:first_cotton/services/api/otp_new.dart';
import 'package:first_cotton/services/local/sharedPreferences.dart';
import 'package:first_cotton/views/bottomNavigation.dart';
import 'package:first_cotton/views/newUserRegistration.dart/newUser.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../services/api/otp_verify.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

Timer? timer;
bool resendOtp = false;
bool showTimer = false;
int? finalTime = 0;
int currentTime = 30;

class MyTimeNotifier extends ChangeNotifier {
  void timeTracker() {
    if (currentTime > 0) {
      currentTime = currentTime - 1;
    } else {
      timer!.cancel();
    }
    notifyListeners();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _timeNotifier = MyTimeNotifier();
  bool readOnly = false;

  bool isVerified = false;
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _timeNotifier.timeTracker();
      if (currentTime == finalTime) {
        setState(() {
          resendOtp = true;
          showTimer = false;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  bool otpSent = false;
  bool loading = false;
  bool numberCheck = false;
  bool otpCheck = false;
  TextEditingController numberController = TextEditingController();
  TextEditingController fieldOne = TextEditingController();
  TextEditingController fieldTwo = TextEditingController();
  TextEditingController fieldThree = TextEditingController();
  TextEditingController fieldFour = TextEditingController();
  TextEditingController fieldFive = TextEditingController();
  TextEditingController fieldSix = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
          ),
          child: SingleChildScrollView(
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
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Enter your mobile number',
                  style: TextStyle(fontSize: 18.sp),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: numberCheck ? Colors.red : Colors.grey)),
                  child: TextField(
                    textInputAction: TextInputAction.go,
                    controller: numberController,
                    style: TextStyle(fontSize: 20.sp),
                    textAlign: TextAlign.center,
                    readOnly: readOnly,
                    maxLength: 10,
                    keyboardType: const TextInputType.numberWithOptions(),
                    decoration: const InputDecoration(
                        counterText: '', border: InputBorder.none),
                    onSubmitted: (s)async{
                      print(s);
                      if(s.isNotEmpty && s.length == 10){
                        setState((){
                          numberCheck = false;
                          loading =true;
                        });
                        sendOTP();
                      }
                      else{
                        setState((){
                          loading =false;
                          numberCheck = true;
                        });
                      }
                    },
                  ),
                ),
                numberCheck
                    ? Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "Please enter a valid number",
                          style: TextStyle(color: Colors.red, fontSize: 14.sp),
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 12,
                ),
                otpSent
                    ? Text(
                        "OTP",
                        style: TextStyle(
                            fontSize: 16.sp, color: const Color(0xff616161)),
                      )
                    : const SizedBox(
                        height: 0,
                      ),
                const SizedBox(
                  height: 10,
                ),
                otpSent
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 12.w,
                            height: 12.w,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6),
                                bottomLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6),
                              ),
                              // boxShadow: const [
                              //   BoxShadow(
                              //       color: Color.fromRGBO(
                              //           0, 0, 0, 0.10000000149011612),
                              //       offset: Offset(0, 4),
                              //       blurRadius: 4)
                              // ],
                              // color: const Color.fromRGBO(255,255,255,1),
                              border: Border.all(
                                color:otpCheck ? Colors.red : const Color.fromRGBO(224, 224, 224, 1),
                                width: 1,
                              ),
                            ),
                            child: TextField(
                              style: TextStyle(fontSize: 20.sp),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: fieldOne,
                              maxLength: 1,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                counterText: '',
                              ),
                              onChanged: (value) {
                                if (value.length == 1) {
                                  if (value.isEmpty && fieldTwo.text.isEmpty) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 12.w,
                            height: 12.w,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6),
                                bottomLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6),
                              ),
                              // boxShadow: const [
                              //   BoxShadow(
                              //       color: Color.fromRGBO(
                              //           0, 0, 0, 0.10000000149011612),
                              //       offset: Offset(0, 4),
                              //       blurRadius: 4)
                              // ],
                              // color: const Color.fromRGBO(248, 247, 252, 1),
                              border: Border.all(
                                color:otpCheck ? Colors.red : const Color.fromRGBO(224, 224, 224, 1),
                                width: 1,
                              ),
                            ),
                            child: TextField(
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20.sp),
                              keyboardType: TextInputType.number,
                              controller: fieldTwo,
                              maxLength: 1,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                counterText: '',
                              ),
                              onChanged: (value) {
                                if (value.isEmpty && fieldThree.text.isEmpty) {
                                  FocusScope.of(context).previousFocus();
                                }
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 12.w,
                            height: 12.w,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6),
                                bottomLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6),
                              ),
                              // boxShadow: const [
                              //   BoxShadow(
                              //       color: Color.fromRGBO(
                              //           0, 0, 0, 0.10000000149011612),
                              //       offset: Offset(0, 4),
                              //       blurRadius: 4)
                              // ],
                              // color: const Color.fromRGBO(248, 247, 252, 1),
                              border: Border.all(
                                color:otpCheck ? Colors.red : const Color.fromRGBO(224, 224, 224, 1),
                                width: 1,
                              ),
                            ),
                            child: TextField(
                              style: TextStyle(fontSize: 20.sp),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: fieldThree,
                              maxLength: 1,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                counterText: '',
                              ),
                              onChanged: (value) {
                                if (value.isEmpty && fieldFour.text.isEmpty) {
                                  FocusScope.of(context).previousFocus();
                                }
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 12.w,
                            height: 12.w,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6),
                                bottomLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6),
                              ),
                              // boxShadow: const [
                              //   BoxShadow(
                              //       color: Color.fromRGBO(
                              //           0, 0, 0, 0.10000000149011612),
                              //       offset: Offset(0, 4),
                              //       blurRadius: 4)
                              // ],
                              // color: const Color.fromRGBO(248, 247, 252, 1),
                              border: Border.all(
                                color:otpCheck ? Colors.red : const Color.fromRGBO(224, 224, 224, 1),
                                width: 1,
                              ),
                            ),
                            child: TextField(
                              style: TextStyle(fontSize: 20.sp),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: fieldFour,
                              maxLength: 1,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                counterText: '',
                              ),
                              onChanged: (value) {
                                if (value.isEmpty && fieldFive.text.isEmpty) {
                                  FocusScope.of(context).previousFocus();
                                }
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 12.w,
                            height: 12.w,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6),
                                bottomLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6),
                              ),
                              // boxShadow: const [
                              //   BoxShadow(
                              //       color: Color.fromRGBO(
                              //           0, 0, 0, 0.10000000149011612),
                              //       offset: Offset(0, 4),
                              //       blurRadius: 4)
                              // ],
                              // color: const Color.fromRGBO(248, 247, 252, 1),
                              border: Border.all(
                                color:otpCheck ? Colors.red : const Color.fromRGBO(224, 224, 224, 1),
                                width: 1,
                              ),
                            ),
                            child: TextField(
                              style: TextStyle(fontSize: 20.sp),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: fieldFive,
                              maxLength: 1,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                counterText: '',
                              ),
                              onChanged: (value) {
                                if (value.isEmpty && fieldSix.text.isEmpty) {
                                  FocusScope.of(context).previousFocus();
                                }
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 12.w,
                            height: 12.w,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6),
                                bottomLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6),
                              ),
                              // boxShadow: const [
                              //   BoxShadow(
                              //       color: Color.fromRGBO(
                              //           0, 0, 0, 0.10000000149011612),
                              //       offset: Offset(0, 4),
                              //       blurRadius: 4)
                              // ],
                              // color: const Color.fromRGBO(248, 247, 252, 1),
                              border: Border.all(
                                color:otpCheck ? Colors.red : const Color.fromRGBO(224, 224, 224, 1),
                                width: 1,
                              ),
                            ),
                            child: TextField(
                              style: TextStyle(fontSize: 20.sp),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: fieldSix,
                              maxLength: 1,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                counterText: '',
                              ),
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  FocusScope.of(context).previousFocus();
                                }
                                if (value.length == 1) {
                                  FocusScope.of(context).unfocus();
                                }
                              },
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
                otpCheck
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          "Please enter a valid OTP",
                          style: TextStyle(color: Colors.red, fontSize: 14.sp),
                        ),
                      )
                    : const SizedBox(),
                otpSent
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.popAndPushNamed(context, "/login");
                          },
                          child: Text(
                            "Not your Number ?",
                            style: TextStyle(
                                color: const Color(0xff35935C),
                                fontSize: 14.sp),
                          ),
                        ),
                      )
                    : const SizedBox(),

                // const SizedBox(
                //   height: 12,
                // ), //space between otp and button

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    showTimer
                        ? AnimatedBuilder(
                            animation: _timeNotifier,
                            builder: (_, __) => Text(
                                  '00:$currentTime',
                                  style: const TextStyle(
                                    color: Color(0xff27AE60),
                                  ),
                                ))
                        : const SizedBox(),
                    otpSent
                        ? TextButton(
                            child: Text(
                              'Resend Otp',
                              style: TextStyle(
                                color:
                                    resendOtp ? Color(0xff27AE60) : Colors.grey,
                              ),
                            ),
                            onPressed: () {
                              sendOTP();
                            },
                          )
                        : const SizedBox()
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () async {
                      if (numberController.text != "" &&
                          numberController.text.length == 10) {
                        numberCheck = false;
                        setState(() {
                          loading = true;
                        });
                        if (otpSent) {
                          try {
                            /// called the verify otp function
                            verifyOTP();
                          } catch (e) {
                            Helpers().showToast(e.toString());
                          }
                        } else {
                          try {
                            /// called the send otp function
                            sendOTP();
                          } catch (e) {
                            Helpers().showToast(e.toString());
                          }
                        }
                      } else {
                        setState(() {
                          numberCheck = true;
                        });
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 51,
                      decoration: BoxDecoration(
                        color: const Color(0xff35935C),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: loading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              otpSent ? isVerified ?  "LOGIN" : "SUBMIT OTP": "SEND OTP",
                              style: GoogleFonts.inter(
                                  fontSize: 14.sp, color: Colors.white),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  sendOTP() async {
    String? fcmToken = await SharedPrefs().getFcmToken();
    Map data = {
      "mobileNumber": numberController.text,
      "countryCode": "+91",
      "fcmRegistrationToken": fcmToken
    };
    var body = json.encode(data);

    http.Response response = await http.post(
      Uri.parse("https://beta.firstcotton.app/api/auth/login"),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    if (response.statusCode == 200) {
      OtpSentApi data = OtpSentApi.fromJson(convert.jsonDecode(response.body));
      isVerified = data.data!.userIsVerified!;
      Helpers().showToast("OTP SENT TO ${numberController.text}");
      setState(() {
        otpSent = true;
        readOnly = true;
        showTimer = true;
        loading = false;
      });
      startTimer();
    } else {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => NewUser(),
      //     ));
      Helpers().showToast(
          "Couldn't sent otp \n error : ${response.statusCode} ");
      setState(() {
        loading = false;
      });
    }
  }

  verifyOTP() async {
    String OTP = fieldOne.text +
        fieldTwo.text +
        fieldThree.text +
        fieldFour.text +
        fieldFive.text +
        fieldSix.text;
    if (OTP.length == 6) {
      setState((){
        otpCheck = false;
      });
      Map otp = {
        "inputOTP": OTP,
      };
      var body = json.encode(otp);

      http.Response response = await http
          .post(
            Uri.parse(
                "https://beta.firstcotton.app/api/auth/verify/91/${numberController.text}"),
            headers: {"Content-Type": "application/json"},
            body: body,
          )
          .timeout(const Duration(seconds: 60));
      OtpVerify data = OtpVerify.fromJson(convert.jsonDecode(response.body));
      if (data.data!.oTPIsValid!) {
        setState(() {
          showTimer = false;
          otpCheck = false;
          currentTime = 30;
        });
        isVerified  ? await SharedPrefs()
            .saveUserEmail(data.data!.user!.email!) : null;
        await SharedPrefs()
            .saveUserId(data.data!.user!.sId!);
        await SharedPrefs()
            .saveUserToken(data.data!.loginToken!);
        await SharedPrefs()
            .saveUserNumber(numberController.text);
       isVerified ? await SharedPrefs()
            .saveUserName(data.data!.user!.name!) : null;
       print(isVerified);
       if(!mounted)return;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
              isVerified ?  const BottomNavigation() : const NewUser() ));
      } else {
        setState(() {
          otpCheck = true;
          Helpers().showToast("Please enter a valid OTP");
          fieldOne.clear();
          fieldTwo.clear();
          fieldThree.clear();
          fieldFour.clear();
          fieldFive.clear();
          fieldSix.clear();
        });
      }
      setState(() {
        loading = false;
      });
    } else {
      setState(() {
        otpCheck = true;
        loading = false;
      });
    }
  }
}
