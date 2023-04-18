import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helpers{
  showToast(String message){
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xff27AE60),
        textColor: Colors.white,
        fontSize: 16.0);
  }
}