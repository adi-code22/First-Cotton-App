
import 'dart:convert';

import 'package:first_cotton/helpers/flutterToast.dart';
import 'package:first_cotton/services/api/registerApiRenponse.dart';

import '../services/local/sharedPreferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
registerUserToDb(String name,String email,String businessName,String gst)async{
  try{
    String? token = await SharedPrefs().getToken();
    Map data = {
      "name": name,
      "email": email,
      "businessName": businessName,
      "gst": gst,
    };
    var body = json.encode(data);
    http.Response response = await http.post(
        Uri.https("beta.firstcotton.app", "/api/user/register"),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token'
        },
        body: body
    );
    RegisterApiResponse datas =
    RegisterApiResponse.fromJson(convert.jsonDecode(response.body));
    if(response.statusCode == 200){
      print(datas.data!.user!.sId);
       await SharedPrefs()
          .saveUserEmail(datas.data!.user!.email!) ;
      await SharedPrefs()
          .saveUserId(datas.data!.user!.sId!);
      await SharedPrefs()
          .saveUserName(datas.data!.user!.name!) ;
    Helpers().showToast(datas.data!.message!);

      return true;
    }else{
      Helpers().showToast("Something went wrong \n error:${response.statusCode}");
      return false;
    }


  }
  catch(e){
  }
}