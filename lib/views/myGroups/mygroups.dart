import 'package:first_cotton/views/myGroups/widgets/groupdetailspage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class MyGroups extends StatefulWidget {
  const MyGroups({Key? key}) : super(key: key);

  @override
  State<MyGroups> createState() => _MyGroupsState();
}

class _MyGroupsState extends State<MyGroups> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Groups",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 8.h,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Search Groups",
                      prefixIcon: false
                          ? IconButton(
                              icon: const Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                // setState(() {
                                //   isSearching = false;
                                // });
                                searchController.text = "";
                              },
                            )
                          : IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () {},
                            ),
                      border: InputBorder.none,
                    ),
                    onChanged: (s) {
                      // if (s.isNotEmpty) {
                      //   setState(() {
                      //     isSearching = true;
                      //   });
                      //   searchList = [];
                      //   for (var element in items) {
                      //     if (element.entityName
                      //         .toLowerCase()
                      //         .contains(s.toLowerCase())) {
                      //       searchList.add(element);
                      //     }
                      //   }
                      // } else {
                      //   setState(() {
                      //     isSearching = false;
                      //     searchController.text = "";
                      //   });
                      // }
                      //result = json.where((o) => o['Product'] == searchController.text || o["Price"].toString() == searchController.text ).toList();
                    },
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Container(
                        child: Align(
                          alignment: Alignment.center,
                          child: false
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  "Create New Group",
                                  style: GoogleFonts.inter(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                  ),
                                ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 1.sp),
                        ),
                        height: 5.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroupDetails(
                        title: 'Coimbatore 1',
                      ),
                    ));
              },
              child: ListTile(
                title: Text("Coimbatore 1"),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
