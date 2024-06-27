import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocdear/cubit/layout/layout_cubit/layout_cubit.dart';
import 'package:ocdear/cubit/todo_cubit/todo_cubit.dart';
import 'package:ocdear/screen/auth/cubit/auth_cubit.dart';
import 'package:ocdear/screen/intro/splash_screen/splash.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/todo_screen/bloc/bloc_exports.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/todo_screen/servises/app_router.dart';
import 'package:ocdear/shared/bloc_observer/bloc_observer.dart';
import 'package:ocdear/shared/constants/constants.dart';
import 'package:ocdear/shared/network/local_network.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheNetwork.cacheInitialization(key: 'access_token');
  userToken = await CacheNetwork.getCacheData(key: 'access_token');
  ToDoCubit().getTask();

  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => LayoutCubit(),
        ),
        BlocProvider(
          create: (context) => ToDoCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'ReadexPro',
        ),
        home: const SplashScreen(),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
