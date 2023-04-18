import 'package:first_cotton/view_models/firebaseCalls.dart';

import '../views/dashboard/dashboard.dart';

addMessage(chatRoomId, int count, bool isImage, String message) async {
  // isImage ? message = messageTextEditting: message = messageTextEditting.text   ;
  var lastMessageTs = DateTime.now().millisecondsSinceEpoch;
  // var pic = MyEncryptionDecryption.encryptAES(message);
//messageId
//     if (messageId == "") {
//       messageId = randomAlphaNumeric(12);
  String tempmsg = message;
  // _controller.text = "";
  // var aes = MyEncryptionDecryption.encryptAES(message);
  Map<String, dynamic> messageInfoMap = {
    "message": tempmsg,
    "sendBy": userName,
    "ts": lastMessageTs,
    "isImage": isImage,
  };

  await addMessageToDb(chatRoomId, messageInfoMap).then((value) async {
    print(count);
    Map<String, dynamic> lastMessageInfoMap = {
      "lastMessage": tempmsg,
      "lastMessageSendTs": lastMessageTs,
      "lastMessageSendBy": userName,
      "readStatus": [userNumber],
      "count": count,
      "show": true,
      "isImage": isImage,
    };
    await updateLastMessageSend(chatRoomId, lastMessageInfoMap);
  });
}