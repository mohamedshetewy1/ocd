import 'package:flutter/material.dart';

class MainLogo extends StatelessWidget {
  const MainLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: SizedBox(
          height: 51,
          width: 67,
          child: Image.asset("assets/images/ocd logo.png"),
        )
        // Container(
        //   height: 60,
        //   decoration: const BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage(
        //         "assets/images/OCDearLogo.png",

        //       ),
        //       scale: 1,
        //     ),
        //   ),
        // ),
        );
  }
}
