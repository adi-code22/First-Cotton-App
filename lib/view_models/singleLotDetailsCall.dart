import 'package:first_cotton/helpers/flutterToast.dart';
import 'package:first_cotton/services/api/singlelotapi.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../services/local/sharedPreferences.dart';

Future<Data?> singleLotDetailsData(String lotId) async {
  String? token = await SharedPrefs().getToken();
  http.Response response = await http.get(
    Uri.https(dotenv.env['API_URL'].toString(),
        'api/lots/$lotId/testdata/v/report'),
    headers: {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token'
    },
  );
  SingleLotApi data = SingleLotApi.fromJson(convert.jsonDecode(response.body));
  if (response.statusCode == 200) {
    return data.data;
  } else {
    Helpers().showToast(' error : ${response.statusCode}');
    print(response.body);
    return null;
  }
}
