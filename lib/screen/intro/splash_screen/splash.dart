// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ocdear/screen/auth/login_screens/login_screen.dart';
import 'package:ocdear/screen/intro/onboarding_screen/onboarding.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/nav_child.dart';
import 'package:ocdear/shared/constants/constants.dart';
import 'package:ocdear/shared/network/local_network.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    loadData();
    super.initState();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  // @override
  // void dispose() {
  //   // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //   //     overlays: SystemUiOverlay.values);
  //   super.dispose();
  // }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    var isLogin = await CacheNetwork.getCacheData(key: 'isLogin');
    userToken = await CacheNetwork.getCacheData(key: 'access_token');

    // ignore: unrelated_type_equality_checks
    if (isLogin == "true") {
      if (userToken != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const NavChild(),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash/splash.jpg"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
