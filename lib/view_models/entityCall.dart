import 'package:first_cotton/services/api/Entity.dart';
import 'package:first_cotton/services/api/dashboardApi.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../helpers/flutterToast.dart';
import '../services/local/sharedPreferences.dart';

Future entityData(String userId) async {
  String? token = await SharedPrefs().getToken();
  http.Response response = await http.get(
    Uri.https(
        dotenv.env['API_URL'].toString(), "api/user/$userId/entity/"),
    headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token'
    },
  );
  EntityResponse data =
      EntityResponse.fromJson(convert.jsonDecode(response.body));
  if (response.statusCode == 200) {
    return data;
  } else {
    Helpers().showToast("Something went wrong \n error:${response.statusCode}");
    return null;
  }
}
