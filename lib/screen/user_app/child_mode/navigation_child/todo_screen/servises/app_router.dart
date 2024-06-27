import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/todo_screen/recycle_bin.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/todo_screen/todo_ui.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(
          builder: (_) => RecycleBin(),
        );
      case TodoTab.id:
        return MaterialPageRoute(
          builder: (_) => const TodoTab(),
        );
      default:
        return null;
    }
  }
}
