import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruiteapp/common/helper.dart';

Widget userReply({required context, required message}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width - 45,
      ),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
                bottomRight: Radius.circular(8.r))),
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 5.h),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 10.w,
                right: 30.w,
                top: 10.h,
                bottom: 10.h,
              ),
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget ownReply({required context, required message}) {
  return Align(
    alignment: Alignment.centerRight,
    child: ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width - 45,
      ),
      child: Card(
        
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
                bottomLeft: Radius.circular(8.r))),
        color: HexColor("#27AE60"),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 10.w,
                right: 30.w,
                top: 10.h,
                bottom: 10.h,
              ),
              child: Text(
                message,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
