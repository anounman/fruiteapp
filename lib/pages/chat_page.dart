import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruiteapp/common/helper.dart';
import 'package:fruiteapp/model/fruite_model.dart';
import 'package:fruiteapp/pages/widget/fruite_price_card.dart';
import 'package:fruiteapp/pages/widget/message_card.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatePage extends StatefulWidget {
  ChatePage({Key? key, required this.data}) : super(key: key);
  FruiteModel data;

  @override
  State<ChatePage> createState() => _ChatePageState();
}

class _ChatePageState extends State<ChatePage> {
  @override
  void initState() {
    super.initState();
  }

  FocusNode focusNode = FocusNode();
  ScrollController scrollController = ScrollController();
  TextEditingController controller = TextEditingController()
    ..text = "What are the payment Terms?";
  List<String> message = [];
  sendMessage() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    message.add(controller.text);
    controller.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(236, 234, 222, 1),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios)),
        title: widget.data.seller.toString().text.black.size(16.sp).make(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height(context) - 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Loot Details"
                      .text
                      .size(16.sp)
                      .fontWeight(FontWeight.w500)
                      .black
                      .make()
                      .pOnly(bottom: 7.h),
                  fruiteCard(data: widget.data),
                  userReply(
                      context: context,
                      message: "Hello Buyer we have Apples ready to ship"),
                  userReply(context: context, message: "Do let me know "),
                  ownReply(
                      context: context, message: "How fast can you deliver?"),
                  Expanded(
                    child: ListView.builder(
                        controller: scrollController,
                        itemCount: message.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => ownReply(
                            context: context, message: message[index])),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: width(context) * 0.75,
                        child: TextFormField(
                            controller: controller,
                            cursorColor: const Color.fromRGBO(53, 53, 53, 1),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              hintStyle: const TextStyle(
                                  color: Color.fromRGBO(53, 53, 53, 1)),
                              contentPadding: const EdgeInsets.all(5),
                            ))),
                    Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.green,
                      ),
                      child: InkWell(
                        onTap: () {
                          if (controller.text != "") {
                            sendMessage();
                          }
                        },
                        child: const Center(
                            child: Icon(Icons.send, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ).p(10),
      ),
    );
  }
}
