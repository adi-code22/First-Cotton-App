import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AddMembers extends StatefulWidget {
  const AddMembers({Key? key}) : super(key: key);

  @override
  State<AddMembers> createState() => _AddMembersState();
}

class _AddMembersState extends State<AddMembers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        title: Search(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text("ABC Spinning Mills",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  )),
              trailing: Icon(
                Icons.close,
                color: Theme.of(context).primaryColor,
              ),
            ),
            ListTile(
              title: Text("PM Spinning Mills",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  )),
              trailing: Icon(
                Icons.close,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            ListTile(
              title: Text("Arun JRK Agro Industries"),
            ),
            ListTile(
              title: Text("Vikrant Industries"),
            ),
          ],
        ),
      ),
    );
  }
}

class Search extends StatelessWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search...",
              prefixIcon: false
                  ? IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        // setState(() {
                        //   isSearching = false;
                        // });
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
    );
  }
}
