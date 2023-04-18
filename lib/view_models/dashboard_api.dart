import 'package:first_cotton/services/api/dashboardApi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/material.dart';

import '../helpers/flutterToast.dart';
import '../services/local/sharedPreferences.dart';

String time = "";
Future<DashboardApiResponse?>? temp;
Future<Data?> dashboardData() async {
  List items = [];
  // String? token =
  //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtb2JpbGVOdW1iZXIiOiI5ODYxMDEzMzk5IiwiaWF0IjoxNjUwMjA2Njg2LCJleHAiOjE2NTc5ODI2ODZ9.KRMy_X6YDwZ38p60fugVIGAvSWLn5CIs_dIuY43a-m4";
  String? token = await SharedPrefs().getToken();
  print(token);
  http.Response response = await http.get(
    Uri.https("beta.firstcotton.app", "/api/dashboard/v/home"),
    headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token'
    },
  );
  DashboardApiResponse data =
      DashboardApiResponse.fromJson(convert.jsonDecode(response.body));
  if (response.statusCode == 200) {
    // items = data.data as List;

    //sorting the array because dart is changing the order of the array
    List sortedPrice = ['', '', ''];
    List unsortedPrice = data.data!.prices!;
    for (int i = 0; i < unsortedPrice.length; i++) {
      if (unsortedPrice[i].groupName == '29mm') {
        sortedPrice[0] = unsortedPrice[i];
      } else if (unsortedPrice[i].groupName == '31mm') {
        sortedPrice[1] = unsortedPrice[i];
      } else if (unsortedPrice[i].groupName == '35mm') {
        sortedPrice[2] = unsortedPrice[i];
      }
    }

    data.data!.prices = sortedPrice.cast<Prices>();
    time =  data.requestedAt.toString();
    return data.data;
  } else {
    Helpers().showToast('Something went wrong error ${response.statusCode}');
    print(response.statusCode);
  }
  return null;
}

Future<String?> reqTime() async {
  try {
    return time.substring(11, 19);
  } catch (e) {}
}
