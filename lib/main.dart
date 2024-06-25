import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocdear/layout/layout_cubit/layout_cubit.dart';
import 'package:ocdear/screen/auth/cubit/auth_cubit.dart';
import 'package:ocdear/screen/auth/login_screens/login_screen.dart';
import 'package:ocdear/screen/intro/splash_screen/splash.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/nav_child.dart';
// import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/nav_parent.dart';
// import 'package:ocdear/screen/auth/login_screens/login_screen.dart';
// import 'package:ocdear/screen/user_app/child_mode/navigation_child/nav_child.dart';
import 'package:ocdear/shared/bloc_observer/bloc_observer.dart';
import 'package:ocdear/shared/constants/constants.dart';
import 'package:ocdear/shared/network/local_network.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheNetwork.cacheInitialization(key: 'access_token');
  userToken = await CacheNetwork.getCacheData(key: 'access_token');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => LayoutCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'ReadexPro',
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
