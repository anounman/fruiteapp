import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruiteapp/common/helper.dart';
import 'package:velocity_x/velocity_x.dart';

Widget filterBox({required context}) {
  return Container(
    height: 220.h,
    width: width(context),
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: width(context) * 0.3,
                child: "Name".text.size(18.sp).make()),
            Icon(
              Icons.arrow_upward,
              color: Colors.green,
              size: 25.sp,
            ),
            Icon(
              Icons.arrow_downward,
              size: 20.sp,
            )
          ],
        ),
        const Divider(
          thickness: 1,
          color: Color.fromRGBO(196, 196, 196, 1),
        ).pOnly(left: 35.w, right: 35.w).pOnly(top: 20.h, bottom: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: width(context) * 0.3,
                child: "Price".text.size(18.sp).make()),
            Icon(
              Icons.arrow_upward,
              color: Colors.green,
              size: 25.sp,
            ),
            Icon(
              Icons.arrow_downward,
              size: 20.sp,
            )
          ],
        ),
      ],
    ),
  );
}
