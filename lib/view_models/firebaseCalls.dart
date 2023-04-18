import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_cotton/views/dashboard/dashboard.dart';
createRoomFirebase(String groupId, users, sellerName,sellerNumber,buyerName,buyerNumber,lotNumber,lotId)async{
    // create a chat room
    try {
      await FirebaseFirestore.instance.collection("chatRooms").doc(groupId).set({
        'groupName': lotNumber.toString(),
        'users': users,
        'sellerNumber': sellerNumber,
        'sellerName': sellerName,
        'createdAt':DateTime.now(),
        'lastMessageSendTs':DateTime.now().millisecondsSinceEpoch,
        'lastMessageSendBy': buyerNumber,
        'lastMessage':'',
        'buyerNumber': buyerNumber,
        'buyerName':buyerName,
        'lotId':lotId,
        'show' : true,
        'count': 0,
        'isImage': false
      });
      return true;
    }
    catch(e){
      return false;
    }
}

Future addMessageToDb(String chatRoomId ,messageInfoMap) async {
  return await FirebaseFirestore.instance.
  collection("chatRooms").
  doc(chatRoomId).collection('chats').doc().set(messageInfoMap);
}

updateLastMessageSend(String chatRoomId, lastMessageInfoMap){
  return FirebaseFirestore
      .instance.collection('chatRooms').doc(chatRoomId)
      .update(lastMessageInfoMap);
}

Future<bool> checkRoomStatus(groupId)async{
  final snapshot = await FirebaseFirestore.instance
      .collection('chatRooms')
      .doc(groupId)
      .get();
  if (snapshot.exists){
    //chat already exists
    return true;
  }
  else{return false;}
}


checkGroup(String userName , chatRoomId)async{
  print('bjbjj');
  DocumentSnapshot ds = await  FirebaseFirestore.instance.collection("chatRooms").doc(chatRoomId!).get();
  if(ds["lastMessageSendBy"] != userName) {
    Map<String,dynamic>readMap = {'readStatus':  FieldValue.arrayUnion([userNumber])};
    FirebaseFirestore.instance.collection("chatRooms").doc(chatRoomId).update(readMap);
  }
}