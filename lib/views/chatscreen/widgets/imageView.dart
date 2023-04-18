
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ImageViewer extends StatelessWidget {
  final String  imgSrs;
  const ImageViewer({Key? key, required this.imgSrs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
        IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon:const Icon(Icons.close),),
      ],),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.network(imgSrs,
            // width: 100.w,
            // height: 100.h,
              // fit: BoxFit.contain,
            ),

          ],
        ),
      ),
    );
  }
}
