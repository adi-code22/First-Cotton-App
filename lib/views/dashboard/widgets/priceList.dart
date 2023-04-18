import 'package:first_cotton/services/api/dashboardApi.dart';
import 'package:first_cotton/views/dashboard/widgets/titleRow.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

Container priceList(
    int index, BuildContext context, Data? items, List prices, String time) {
  return Container(
    height: 34.h,
    width: 91.w,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      boxShadow: const [
        BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.10000000149011612),
            offset: Offset(0, 1),
            blurRadius: 4)
      ],
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        items != null
            ? Text(
                prices[index].groupName + " Spot Price",
                style: Theme.of(context).textTheme.headlineMedium,
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
        const SizedBox(
          height: 16,
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items != null ? prices[index].items.length : 4,
            itemBuilder: (ctx, index1) {
              return Column(
                children: [
                  items != null
                      ? titleRow(
                          prices[index].items[index1].growth,
                          prices[index].items[index1].perCandyCurr.toString(),
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
                  (items != null)
                      ? (prices[index].items.length - 1 != index1)
                          ? const Divider(
                              thickness: 1.0,
                            )
                          : const SizedBox()
                      : const Divider(
                          thickness: 1.0,
                        ),
                ],
              );
            }),
        const SizedBox(
          height: 8,
        ),
        Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Updated on " + time,
              // timeFormat.format(prices[index].items.first.date),
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 8.sp,
                  color: Colors.grey),
            )),
        const SizedBox(
          height: 8,
        ),
      ],
    ),
  );
}
