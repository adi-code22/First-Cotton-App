
import 'dart:io';
import 'package:first_cotton/view_models/sendMessage.dart';
import 'package:first_cotton/views/chatscreen/chatscreen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../helpers/flutterToast.dart';
import '../../../services/api/sendFiles.dart';

class SendImage extends StatefulWidget {
  final List images;
   File  imgSrs;
  final String chatRoomId;
   int count;
   SendImage({Key? key, required this.imgSrs, required this.chatRoomId,
    required this.count, required this.images}) : super(key: key);

  @override
  State<SendImage> createState() => _SendImageState();
}

class _SendImageState extends State<SendImage> {
  int indexes = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
        onPressed: (){

          setState((){
            widget.images.removeAt(indexes);
          if(widget.images.isEmpty){
            Navigator.pop(context);
            return;
          }

          if((indexes == widget.images.length || indexes < widget.images.length) && indexes != 0){
            widget.imgSrs = File(widget.images[indexes-1].path);
            indexes = indexes - 1;}
          else{
            widget.imgSrs = File(widget.images.first.path);
          }});

        },
        icon:const Icon(Icons.delete,color: Colors.black,),

),
        actions: [
          IconButton(onPressed: (){
            imgFile = null;
            Navigator.pop(context);
          },
            icon:const Icon(Icons.close,color: Colors.black,),),
        ],),
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.file(
            widget.imgSrs,
            gaplessPlayback: true,
            width: 100.w,
            height: 100.h,
            // fit: BoxFit.cover,
          ),
        widget.images.length > 1 ?  Positioned(
            bottom: 100,
            child: SizedBox(
              width: 100.w,
              height: 80,
              child: ListView.builder(
                itemCount: widget.images.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(ctx,index){
                return GestureDetector(
                  onTap: (){
                    setState((){
                      widget.imgSrs = File(widget.images[index].path);
                      indexes = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: widget.imgSrs.path == File(widget.images[index].path).path
                            ? blueColor : Colors.transparent,width: 3)
                      ),
                        child: Image.file(File(widget.images[index].path),width: 80,height: 80,)),
                  ),
                );
              } ),
            ),
          ) :const SizedBox(),
          Positioned(
            bottom: 50,
            right: 20,
            child: Container(
              margin:const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(25)
              ),
              child: IconButton(
                color: const Color(0xFFF4F4DD),
                onPressed: () async{
                  print(widget.images.length);
                  if(widget.images.length == 1){
                  String imgUrl =
                  await sendFilesToDb(widget.imgSrs,'image');
                  // print(imgUrl);
                  if(imgUrl != 'Something Went Wrong!!!'){
               await   addMessage(widget.chatRoomId, widget.count++, true, imgUrl);
                  imgUrl = "";
                  }
                  }
                  else{
                    for(int i = 0 ; i < widget.images.length ; i++){
                      String imgUrl =
                    await sendFilesToDb(File(widget.images[i].path),'image');
                    print(imgUrl);
                    if(imgUrl != 'Something Went Wrong!!!'){
                    await  addMessage(widget.chatRoomId, widget.count++, true, imgUrl);
                      imgUrl = '';
                    }
                    }
                  }
                  Navigator.pop(context);

                         },
                icon: const Icon(
                  Icons.send,
                  color:  Color(0xFFF4F4DD),
                  size: 24,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
