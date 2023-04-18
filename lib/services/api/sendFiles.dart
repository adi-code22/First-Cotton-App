
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:first_cotton/services/api/sendFileToDb.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:convert' as convert;

import '../../helpers/flutterToast.dart';
import '../local/sharedPreferences.dart';

sendFilesToDb(File file,String type) async {
  Dio dio = Dio();
  String? token = await SharedPrefs().getToken();

  try {
    String fileName = file
        .path
        .split('/')
        .last;
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path, filename: fileName,
          contentType: type == 'pdf' ? MediaType('pdf', 'pdf') : MediaType('image', 'png') ),
      'type': type == 'pdf' ? 'pdf/pdf' : 'image/png'
    });
    Response response = await dio.post(
        'https://beta.firstcotton.app/api/chat/v/sendFile', data: formData,
        options: Options(
            method: 'POST',
            headers: {
              'Authorization': 'Bearer $token',
            }
        ));
    // print(response.data);
    SendFileResponse data = SendFileResponse.fromJson(
        response.data);
    // print('this is   ${data.data!.chatFile!.chatFileLink}');
    if(response.statusCode == 200){
      return data.data!.chatFile!.chatFileLink;
    }
    else {
      Helpers().showToast('Something Went Wrong!!! \n error : ${response.statusCode}');

      return 'Something Went Wrong!!!';
    }
  } catch (e) {
    print(e.toString());
  }
}