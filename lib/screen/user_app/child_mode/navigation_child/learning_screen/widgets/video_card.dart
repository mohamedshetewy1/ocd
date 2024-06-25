import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/learning_screen/widgets/video_page.dart';
import 'package:ocdear/utils/text_style.dart';

class VideoCard extends StatelessWidget {
  final String? image;
  const VideoCard({
    this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const VideoPage(),
              ),
            );
          },
          child: Container(
            width: 190,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: Colors.grey),
            ),
            child: Column(
              children: [
                Container(
                  height: 115,
                  width: 190,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/home/video.png"),
                        fit: BoxFit.fill),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(35),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SvgPicture.asset(
                          "assets/icons/Polygon 1.svg",
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 170,
                  height: 25,
                  decoration: const BoxDecoration(),
                  child: const Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        children: [
                          Text("إسم الفيديو",
                              style: AppTextStyle.textStyleNormal17),
                          Gap(45),
                          Text("00:00", style: AppTextStyle.textStyleGrey14),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
