import 'package:first_cotton/services/api/dashboardApi.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

Expanded topSmallCard(
  BuildContext context,
  Data? items,
) {
  return Expanded(
    flex: 2,
    child: Container(
      margin: const EdgeInsets.only(right: 8.15),
      height: 10.h > 65 ? 10.h : 12.h,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
              offset: Offset(0, 1),
              blurRadius: 4)
        ],
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: ListTile(
        title: items != null
            ? Text(
                items.bales.toString(),
                style: TextStyle(
                    fontSize: 20.sp, color: Theme.of(context).primaryColor),
              )
            : Shimmer.fromColors(
                enabled: true,
                child: Container(
                  width: 1.0,
                  height: 18.0,
                  color: Colors.white,
                ),
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
              ),
        subtitle: items != null
            ? Text(
                'Bales Available',
                style: Theme.of(context).textTheme.bodySmall,
              )
            : Shimmer.fromColors(
                enabled: true,
                child: Container(
                  width: 1.0,
                  height: 18.0,
                  color: Colors.white,
                ),
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
              ),
      ),
    ),
  );
}
