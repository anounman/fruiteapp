import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruiteapp/model/fruite_model.dart';
import 'package:velocity_x/velocity_x.dart';

Widget fruiteCard({required FruiteModel data}) {
  return Container(
    height: 160.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r), color: Colors.white),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        data.seller
            .toString()
            .text
            .hexColor("#4F4F4F")
            .size(14.sp)
            .fontFamily('Inter')
            .make()
            .pOnly(left: 10.w, bottom: 15.h),
        Container(
            height: 152.h * 0.72,
            color: const Color.fromRGBO(244, 244, 221, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        data.product
                            .toString()
                            .text
                            .fontWeight(FontWeight.w800)
                            .fontFamily("Roboto")
                            .hexColor("#4F4F4F")
                            .size(16.sp)
                            .make(),
                        "Product".text.hexColor("#828282").size(10.sp).make()
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        data.variety
                            .toString()
                            .text
                            .fontWeight(FontWeight.w800)
                            .fontFamily("Roboto")
                            .hexColor("#4F4F4F")
                            .size(16.sp)
                            .make(),
                        "Variety".text.hexColor("#828282").size(10.sp).make()
                      ],
                    ),
                    Container(
                      height: 25.h,
                      width: 73.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: const Color.fromRGBO(33, 33, 33, 0.08)),
                      child: Center(
                        child: "₹45.5k"
                            .text
                            .size(16.sp)
                            .hexColor("#27AE60")
                            .make(),
                      ),
                    )
                  ],
                ).pOnly(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        "${data.avgWeight.toString()}gms"
                            .text
                            .fontWeight(FontWeight.w400)
                            .fontFamily("Roboto")
                            .black
                            .size(16.sp)
                            .make(),
                        "avg weight".text.hexColor("#828282").size(10.sp).make()
                      ],
                    ),
                    Column(
                      children: [
                        "${data.perBox.toString()}kg"
                            .text
                            .fontWeight(FontWeight.w400)
                            .fontFamily("Roboto")
                            .black
                            .size(16.sp)
                            .make(),
                        "per box".text.hexColor("#828282").size(10.sp).make()
                      ],
                    ),
                    Column(
                      children: [
                        data.boxes
                            .toString()
                            .text
                            .fontWeight(FontWeight.w400)
                            .fontFamily("Roboto")
                            .black
                            .size(16.sp)
                            .make(),
                        "Boxes".text.hexColor("#828282").size(10.sp).make()
                      ],
                    ),
                    Column(
                      children: [
                        data.delivery
                            .toString()
                            .text
                            .fontWeight(FontWeight.w400)
                            .fontFamily("Roboto")
                            .black
                            .size(16.sp)
                            .make(),
                        "Delivery".text.hexColor("#828282").size(10.sp).make()
                      ],
                    )
                  ],
                )
              ],
            ))
      ],
    ),
  );
}
