import 'package:first_cotton/views/chatscreen/widgets/imageView.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../view_models/download_pdf.dart';

class ImageReceived extends StatefulWidget {
  ImageReceived(
    this.s, {
    Key? key,
  }) : super(key: key);

  String s = "";

  @override
  State<ImageReceived> createState() => _ImageReceivedState();
}

class _ImageReceivedState extends State<ImageReceived> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0, left: 0.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          // width: 50.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            border: Border.all(color: Colors.white),
          ),

          child: Padding(
            padding: const EdgeInsets.all(0),
            child:  ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: widget.s.split('.').last == 'png' ?
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: ((BuildContext context) => ImageViewer(imgSrs: widget.s))));
                },
                child: Image.network(
                  widget.s,
                  fit: BoxFit.fill,
                ),
              ) : GestureDetector(
                onTap: (){
                  String fileName = widget.s.
                  split('https://assets.beta.agridayco.com/').last.split('.').first;
                  downloadAndLaunch(widget.s,fileName);
                },
                child: Image.network(
                  'https://www.sat7uk.org/wp-content/uploads/2018/11/kisspng-pdf-computer-icons-encapsulated-postscript-logo-pdf-5afde5cc758a98.9626072515265888764815.png',
                  // fit: BoxFit.fill,
                  width: 160,
                  height: 170,
                ),
              ),
            ),
            // Text(
            //   widget.s,
            //   style: const TextStyle(fontSize: 15, color: Colors.white),
            // ),
          ),
        ),
      ),
    );
  }
}
