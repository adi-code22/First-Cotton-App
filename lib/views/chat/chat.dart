import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_cotton/services/local/sharedPreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../chatscreen/chatscreen.dart';
import '../dashboard/dashboard.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController searchController = TextEditingController();
  bool searching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2F2F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F2F2F2),
        elevation: 0,
        leadingWidth: 150,
        leading: Center(
          child: Text(
            'Message',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Card(
            child: TextField(
              controller: searchController,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              onChanged: (s) {
                if (s.isNotEmpty) {
                  setState(() {
                    searching = true;
                  });
                } else if (s.isEmpty) {
                  setState(() {
                    searching = false;
                  });
                }
              },
              // textAlign: TextAlign.center,
              decoration: InputDecoration(
                  prefixIcon: searching
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              searching = false;
                            });
                            searchController.text = '';
                          },
                          icon: Icon(Icons.arrow_back_ios))
                      : const Icon(
                          CupertinoIcons.search,
                          size: 20,
                        ),
                  border: InputBorder.none),
            ),
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: searching
            ? FirebaseFirestore.instance
                .collection('chatRooms')
                .where("users", arrayContains: userNumber)
                .where('groupName',
                    isGreaterThanOrEqualTo: searchController.text)
                // .orderBy("lastMessageSendTs", descending: true)
                .snapshots()
            : FirebaseFirestore.instance
                .collection('chatRooms')
                .orderBy("lastMessageSendTs", descending: true)
                .where("users", arrayContains: userNumber)
                .snapshots(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data!.docs[index];

                    return ChattingTile(
                      show: ds['show'],
                      count: ds['count'],
                      message: ds['lastMessage'],
                      time: ds['lastMessageSendTs'],
                      read: ds['readStatus'].contains(userNumber),
                      sendBy: ds['lastMessageSendBy'],
                      groupId: ds.id,
                      lotId: ds['lotId'],
                      groupName: ds['groupName'],
                      groupSubtitle: ds['buyerNumber'] == userNumber
                          ? ds['sellerName']
                          : ds['buyerName'],
                      isImage: ds['isImage'],
                    );
                    //   GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (BuildContext context) => ChatScreen(
                    //                   groupId: ds.id,
                    //                   lotId: ds['lotId'],
                    //                   groupTitle: ds['groupName'].toString(),
                    //                   groupSubTitle:
                    //                       (ds['buyerNumber'] == userNumber
                    //                           ? ds['sellerName']
                    //                           : ds['buyerName']),counter: 0,
                    //                 )));
                    //   },
                    //   child: ListTile(
                    //     title: Row(
                    //       children: [
                    //         Text(
                    //           ds['groupName'].toString(),
                    //           style:
                    //               const TextStyle(fontWeight: FontWeight.bold),
                    //         ),
                    //         const SizedBox(
                    //           width: 10,
                    //         ),
                    //         Expanded(
                    //           // width: 49.w,
                    //           child: Text(
                    //             ds['buyerNumber'] == userNumber
                    //                 ? ds['sellerName']
                    //                 : ds['buyerName'],
                    //             overflow: TextOverflow.ellipsis,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //     subtitle: Text(ds['lastMessage']),
                    //     trailing: Column(
                    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //       children: [
                    //         Text(
                    //           format.format(ds['lastMessageSendTs'].toDate()),
                    //           style: TextStyle(color: Colors.green),
                    //         ),
                    //         CircleAvatar(
                    //           radius: 10.sp,
                    //           backgroundColor: Colors.green,
                    //           child: Text(
                    //             "10",
                    //             style: TextStyle(fontSize: 13.sp),
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //     leading: CircleAvatar(
                    //       // backgroundImage: NetworkImage(
                    //       //     "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                    //       radius: 22.sp,
                    //       child: const Icon(Icons.group,color: Colors.white,),
                    //       backgroundColor: Colors.grey,
                    //     ),
                    //   ),
                    // );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ));
        },
      ),
    );
  }
}

class ChattingTile extends StatefulWidget {
  final bool show;
  final int count;
  final String groupName;
  final String message;
  final int time;
  final bool read;
  final String groupId;
  final String groupSubtitle;
  final String sendBy;
  final String lotId;
  final bool isImage;
  const ChattingTile(
      {Key? key,
      required this.show,
      required this.count,
      required this.message,
      required this.time,
      required this.read,
      required this.sendBy,
      required this.groupId,
      required this.lotId,
      required this.groupName,
      required this.groupSubtitle,
      required this.isImage})
      : super(key: key);

  @override
  State<ChattingTile> createState() => _ChattingTileState();
}

class _ChattingTileState extends State<ChattingTile> {
  final format = DateFormat().add_jm();
  int counter = 0;
  test<bool>() {
    if (widget.sendBy == userNumber) {
      return false;
    } else {
      return true;
    }
  }

  counterTest<bool>() {
    if (widget.count - counter == 0) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.read == true) {
      counter = widget.count;
      SharedPrefs().saveCounter(counter);
    }
    return GestureDetector(
      onTap: () async {
        counter = widget.count;
        SharedPrefs().saveCounter(counter);

        if (widget.read == false) {
          if (test() == true) {
            Map<String, dynamic> readMap = {
              'readStatus': FieldValue.arrayUnion([userNumber])
            };
            await FirebaseFirestore.instance
                .collection("chatRooms")
                .doc(widget.groupId)
                .update(readMap);
          }
        }
        int counters = (await SharedPrefs().getCounterNumber())!;
        if (!mounted) return;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => ChatScreen(
                      groupId: widget.groupId,
                      lotId: widget.lotId,
                      groupTitle: widget.groupName.toString(),
                      groupSubTitle: widget.groupSubtitle,
                      counter: counters, isLot: false,
                    )));
      },
      child: ListTile(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.groupName.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              // width: 49.w,
              child: Text(
                widget.groupSubtitle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        subtitle: widget.isImage
            ? const Align(
                alignment: Alignment.centerLeft, child: Icon(Icons.image))
            : Text(
                widget.message,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              format.format(
                  Timestamp.fromMillisecondsSinceEpoch(widget.time).toDate()),
              style: TextStyle(
                  color: (widget.read == false && test() && widget.show)
                      ? Colors.green
                      : Colors.black),
            ),
            CircleAvatar(
              radius: 10.sp,
              backgroundColor: (widget.read == false && test() && counterTest())
                  ? Colors.green
                  : Colors.transparent,
              child: Text(
                (widget.read == false && test() && counterTest())
                    ? '${widget.count - counter}'
                    : '',
                style: TextStyle(fontSize: 13.sp),
              ),
            )
          ],
        ),
        leading: CircleAvatar(
          // backgroundImage: NetworkImage(
          //     "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          radius: 22.sp,
          child: const Icon(
            Icons.group,
            color: Colors.white,
          ),
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }
}
