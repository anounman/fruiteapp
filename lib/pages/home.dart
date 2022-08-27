import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruiteapp/common/helper.dart';
import 'package:fruiteapp/data/data.dart';
import 'package:fruiteapp/model/fruite_model.dart';
import 'package:fruiteapp/pages/chat_page.dart';
import 'package:fruiteapp/pages/widget/fruite_price_card.dart';
import 'package:velocity_x/velocity_x.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController controller = TextEditingController();
  List<FruiteModel>? fruiteModel;
  List<FruiteModel>? result;
  int filterIndex = 0;
  @override
  void initState() {
    readData();
    super.initState();
  }

  readData() async {
    final String responce = await rootBundle.loadString("assets/fruites.json");
    setState(() {
      result = fruiteModelFromJson(responce.toString());
      fruiteModel = result;
      fruiteModel!.sort(((a, b) {
        return a.seller.toLowerCase().compareTo(b.seller.toLowerCase());
      }));
    });
  }

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
              InkWell(
                onTap: () {
                  fruiteModel = result;

                  fruiteModel!.sort(((a, b) {
                    return a.seller
                        .toLowerCase()
                        .compareTo(b.seller.toLowerCase());
                  }));
                  filterIndex = 0;
                  setState(() {});
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_upward,
                  color: (filterIndex == 0) ? Colors.green : null,
                  size: (filterIndex == 0) ? 25.sp : 20.sp,
                ),
              ),
              InkWell(
                onTap: () {
                  fruiteModel = result;
                  fruiteModel!.sort(((b, a) {
                    return a.seller
                        .toLowerCase()
                        .compareTo(b.seller.toLowerCase());
                  }));
                  filterIndex = 1;
                  setState(() {});
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_downward,
                  color: (filterIndex == 1) ? Colors.green : null,
                  size: (filterIndex == 1) ? 25.sp : 20.sp,
                ),
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
              InkWell(
                onTap: () {
                  filterIndex = 2;

                  filterIndex = 1;
                  setState(() {});
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_upward,
                  color: (filterIndex == 2) ? Colors.green : null,
                  size: (filterIndex == 2) ? 25.sp : 20.sp,
                ),
              ),
              InkWell(
                onTap: () {
                  filterIndex = 3;
                  setState(() {});
                },
                child: Icon(
                  Icons.arrow_downward,
                  color: (filterIndex == 3) ? Colors.green : null,
                  size: (filterIndex == 3) ? 25.sp : 20.sp,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 237, 237, 1),
      body: (fruiteModel == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Buy".text.size(20.sp).bold.make().pOnly(bottom: 20.h),
                    Row(
                      children: [
                        SizedBox(
                            width: width(context) * 0.8,
                            height: 50.h,
                            child: TextFormField(
                              controller: controller,
                              onChanged: (val) {
                                fruiteModel = result!.where((element) {
                                  return element.seller
                                      .toLowerCase()
                                      .startsWith(val.toLowerCase());
                                }).toList();
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                isDense: true,
                                hintText: "Search",
                                hintStyle: TextStyle(
                                  fontSize: 15.sp,
                                  wordSpacing: 2,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(126, 126, 126, 1),
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  size: 20.sp,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            )),
                        InkWell(
                          onTap: () => showModalBottomSheet(
                              context: context,
                              builder: (context) =>
                                  filterBox(context: context)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/Vector.png"),
                              "Sort".text.size(11).make(),
                            ],
                          ).pOnly(left: 20.w),
                        )
                      ],
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              fruite.length,
                              (index) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 64.h,
                                        width: 65.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            color: Colors.white),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                          child: Image.asset(
                                            fruite[index]["image"]!,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      fruite[index]["name"]!
                                          .text
                                          .black
                                          .size(12.sp)
                                          .make()
                                          .pOnly(left: 5.w, top: 5.h)
                                    ],
                                  ).pOnly(right: 20.w)),
                        )).pOnly(top: 15.h),
                    ListView.builder(
                        itemCount: fruiteModel!.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => navigate(
                                context: context,
                                page: ChatePage(data: fruiteModel![index])),
                            child: fruiteCard(data: fruiteModel![index])
                                .pOnly(top: 10.h),
                          );
                        })
                  ],
                ).p(10.h),
              ),
            ),
    );
  }
}
