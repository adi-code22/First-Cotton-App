import 'package:first_cotton/services/api/dashboardApi.dart';
import 'package:first_cotton/views/dashboard/widgets/titleRow.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

Container bottomSmallCard(BuildContext context, Data? items) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    margin: const EdgeInsets.only(right: 16),
    decoration: BoxDecoration(
      boxShadow: const [
        BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
            offset: Offset(0, 1),
            blurRadius: 4)
      ],
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
    ),
    width: 100.w,
    height: 16.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        items != null
            ? titleRow("MCX", items.mcxPrice!.first.price.toString(),
                Theme.of(context).primaryColor)
            : Shimmer.fromColors(
                enabled: true,
                child: Container(
                  width: 80.w,
                  height: 18.0,
                  color: Colors.white,
                ),
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
              ),
        Align(
            alignment: Alignment.centerRight,
            child: items != null
                ? Text(
                    "Updated on " +
                        items.mcxPrice!.first.createdAt
                            .toString()
                            .substring(11, 19),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 8.sp,
                        color: Colors.grey),
                  )
                : Shimmer.fromColors(
                    enabled: true,
                    child: Container(
                      width: 20.w,
                      height: 8.0,
                      color: Colors.white,
                    ),
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                  )),
        const Divider(),
        items != null
            ? titleRow(
                "ICE ${items.icePrice!.first.contract}",
                '-',
                // "\$ ${items.icePrice!.first.lastPrice!}",
                Theme.of(context).primaryColor
                //Colors.green[400]!
                )
            : Shimmer.fromColors(
                enabled: true,
                child: Container(
                  width: 80.w,
                  height: 18.0,
                  color: Colors.white,
                ),
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
              ),
        Align(
            alignment: Alignment.centerRight,
            child: items != null
                ? Text(
                    "Updated on " +
                        items.icePrice!.first.createdAt
                            .toString()
                            .substring(11, 19),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 8.sp,
                        color: Colors.grey),
                  )
                : Shimmer.fromColors(
                    enabled: true,
                    child: Container(
                      width: 20.w,
                      height: 8.0,
                      color: Colors.white,
                    ),
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                  )),
      ],
    ),
  );
}
