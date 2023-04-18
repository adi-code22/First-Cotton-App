import 'dart:convert';
// import 'dart:html';
import 'dart:io';
// import 'dart:html';
import 'package:first_cotton/services/api/createChatRoom.dart';
import 'package:first_cotton/services/local/sharedPreferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../services/api/sendFileToDb.dart';

Future<Group?> createChatRoom(String lotId, String docId) async {
  String? token = await SharedPrefs().getToken();
  Map data = {
    "lotId": lotId,
    "fcmChatId": docId,
  };
  var body = json.encode(data);
  http.Response response = await http.post(
      Uri.https(dotenv.env['API_URL'].toString(),
          dotenv.env['CHAT_DB_URL'].toString()),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token'
      },
      body: body);
  CreateChatRoom some =
      CreateChatRoom.fromJson(convert.jsonDecode(response.body));
  if (response.statusCode == 200) {
    // items = data.data as List;
    print(response.body);
    return some.data!.group;
  } else {
    print(response.statusCode);
    return null;
  }
}
