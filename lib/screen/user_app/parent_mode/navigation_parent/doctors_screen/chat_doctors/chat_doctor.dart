import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

class ChatDoctors extends StatelessWidget {
  const ChatDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                const Gap(2),
                CircleAvatar(
                  backgroundColor: AppColors.light,
                  radius: 30,
                  child: Image.asset(
                    'assets/images/user_chat.png',
                  ),
                ),
                const Gap(10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "د/ سارة أحمد",
                        style: AppTextStyle.textStyleNormal17,
                      ),
                      Gap(2),
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            Text(
                              "نشط الأن  ",
                              style: AppTextStyle.textStyleBlack14,
                            ),
                            CircleAvatar(
                              backgroundColor: AppColors.normalActive,
                              radius: 5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Type your Message here,,",
                          hintStyle: AppTextStyle.textStyleGrey16,
                          border: InputBorder.none),
                    ),
                  ),
                  const Gap(10),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: SvgPicture.asset("assets/icons/chat/Smiley.svg"),
                    ),
                  ),
                  const Gap(10),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child:
                          SvgPicture.asset("assets/icons/chat/LinkSimple.svg"),
                    ),
                  ),
                  const Gap(10),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: SvgPicture.asset("assets/icons/chat/send.svg"),
                    ),
                  ),
                  const Gap(10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
