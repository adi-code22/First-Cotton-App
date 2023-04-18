import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class Notification extends StatefulWidget {
  const Notification({Key? key}) : super(key: key);

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  final format = DateFormat().add_jm();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 7.w,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Notification",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Spot Prices Updated",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    // width: 49.w,
                    child: Text(
                      "",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              subtitle: false
                  ? const Align(
                      alignment: Alignment.centerLeft, child: Icon(Icons.image))
                  : Text(
                      "data",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
              trailing: Text(
                // format.format(
                //     Timestamp.fromMillisecondsSinceEpoch(widget.time)
                //         .toDate()),
                "time",
                style: TextStyle(
                    // color: (widget.read == false && test() && widget.show)
                    color: true ? Colors.green : Colors.black),
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
          ],
        ),
      ),
    );
  }
}
