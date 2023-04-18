import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';

Future<String> download(String url, String filename) async {
  String dir = (await getTemporaryDirectory()).path;
  File file = File('$dir/$filename');
  if (await file.exists()) return file.path;
  await file.create(recursive: true);
  var response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 60));

  if (response.statusCode == 200) {
    await file.writeAsBytes(response.bodyBytes);
    return file.path;
  }
  throw 'Download ${url} failed';
}

void downloadAndLaunch(String url, String filename) {

  download(url, filename).then((String path)async {
    // var filePath =path;
    // final Uri uri = Uri.file(filePath);
    // print(uri);
    // print(await canLaunchUrl(uri));
    // if (await File(uri.toFilePath()).exists()) {
    //
    //   if (await launchUrl(uri,mode: LaunchMode.externalApplication)) {
    //     throw 'Could not launch $uri';
    //   }
    // }
    OpenFile.open(path);
  });
}