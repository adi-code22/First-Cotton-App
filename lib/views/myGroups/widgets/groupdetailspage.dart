import 'package:first_cotton/views/myGroups/widgets/addMembers.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GroupDetails extends StatefulWidget {
  final String title;
  const GroupDetails({Key? key, required this.title}) : super(key: key);

  @override
  State<GroupDetails> createState() => _GroupDetailsState();
}

class _GroupDetailsState extends State<GroupDetails> {
  bool switchC = false;
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {},
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      content: Container(
        height: 20.h,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                      children: [
                    TextSpan(
                        text: "Do you want to remove\n",
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: "Arun JRK Agro Industries ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                    TextSpan(
                        text: "from ", style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: "Coimbatore 1",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black))
                  ])),
            ),
            SizedBox(
              height: 2.7.h,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black),
                      )),
                  height: 7.h,
                )),
                Expanded(
                    child: Container(
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Remove",
                        style: TextStyle(color: Colors.white),
                      )),
                  height: 7.h,
                  color: Colors.red,
                ))
              ],
            )
          ],
        ),
      ),
      // actions: [
      //   cancelButton,
      //   continueButton,
      // ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        leadingWidth: 7.w,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              trailing: Switch(
                activeColor: Theme.of(context).primaryColor,
                onChanged: (bool value) {
                  toggleSwith(value);
                },
                value: switchC,
              ),
              leading: Text(
                "Show all inventory",
                style: TextStyle(color: Colors.black, fontSize: 13.sp),
              ),
            ),
            Container(
              height: 1.h,
              color: Colors.grey[400],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Members",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddMembers(),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "+ Add Members",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 13.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // showDialog(
                //     context: context,
                //     builder: (BuildContext context) {
                //       return AlertDialog(
                // content: RichText(
                //     text: TextSpan(children: [
                //   TextSpan(text: "Do you want to remove "),
                //   TextSpan(
                //       text: "Arun JRK Agro Industries",
                //       style: TextStyle(fontWeight: FontWeight.bold))
                // ])),
                //       );
                //     });
                showAlertDialog(context);
              },
              child: ListTile(
                title: Text("Arun JRK Agro Industries"),
              ),
            ),
            //
          ],
        ),
      ),
    );
  }

  void toggleSwith(bool value) {
    setState(() {
      switchC = value;
    });
  }
}
