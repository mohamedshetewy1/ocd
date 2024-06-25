// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:ocdear/screen/child_mode/navigation_child/game_screen/games_screen.dart';
// import 'package:ocdear/screen/child_mode/navigation_child/game_screen/widgets/games_card.dart';
// import 'package:ocdear/screen/child_mode/navigation_child/learning_screen/widgets/video_card.dart';
// import 'package:ocdear/screen/child_mode/navigation_child/widget/slider_home.dart';
// import 'package:ocdear/screen/child_mode/navigation_child/main_screen/widgets/welcome_child.dart';
// import 'package:ocdear/screen/child_mode/navigation_child/learning_screen/learning_screen.dart';
// import 'package:ocdear/utils/colors.dart';
// import 'package:ocdear/utils/text_style.dart';

// class MainScreen extends StatelessWidget {
//   const MainScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               const WelcomeChild(),
//               const SizedBox(
//                 height: 20,
//               ),
//               const SliderHomePage(),
//               const SizedBox(
//                 height: 32,
//               ),
//               Directionality(
//                 textDirection: TextDirection.rtl,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.only(right: 15),
//                       child: Text(
//                         'فيديوهات تعليمية',
//                         style: AppTextStyle.textStyle22,
//                       ),
//                     ),
//                     TextButton(
//                         onPressed: () {
//                           Navigator.of(context)
//                               .pushReplacement(MaterialPageRoute(
//                             builder: (_) => const LearningTab(),
//                           ));
//                         },
//                         child: const Text(
//                           'عرض المزيد',
//                           style: TextStyle(
//                               decoration: TextDecoration.underline,
//                               color: AppColors.normalActive,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               fontFamily: "ReadexPro"),
//                         ))
//                   ],
//                 ),
//               ),
//               const Gap(10),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [VideoCard(), VideoCard()],
//               ),
//               const Gap(10),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [VideoCard(), VideoCard()],
//               ),
//               const Gap(10),
//               Directionality(
//                 textDirection: TextDirection.rtl,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.only(right: 15),
//                       child: Text(
//                         'مغامرة الوسواس القهري',
//                         style: AppTextStyle.textStyleBold18,
//                       ),
//                     ),
//                     TextButton(
//                         onPressed: () {
//                           Navigator.of(context)
//                               .pushReplacement(MaterialPageRoute(
//                             builder: (_) => const GamesHome(),
//                           ));
//                         },
//                         child: const Text(
//                           'عرض المزيد',
//                           style: TextStyle(
//                               decoration: TextDecoration.underline,
//                               color: AppColors.normalActive,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               fontFamily: "ReadexPro"),
//                         ))
//                   ],
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(right: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [GamesCard(), GamesCard()],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
