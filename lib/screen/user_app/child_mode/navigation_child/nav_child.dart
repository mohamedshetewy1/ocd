import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ocdear/cubit/layout/layout_cubit/layout_cubit.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/game_screen/games_screen.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/learning_screen/learning_screen.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/profile_screen/profile_screen.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/todo_screen/todo_ui.dart';
import 'package:ocdear/utils/text_style.dart';

class NavChild extends StatefulWidget {
  const NavChild({super.key});

  @override
  State<NavChild> createState() => _NavChildState();
}

class _NavChildState extends State<NavChild> {
  int _selectedIndex = 0;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: _selectedIndex,
    );
    BlocProvider.of<LayoutCubit>(context).getUserData();
  }

  final List<Widget> _screens = [
    const LearningTab(),
    const GamesHome(),
    const TodoTab(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: _screens.length,
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        itemBuilder: (context, index) => _screens[_selectedIndex],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        index: _selectedIndex,
        items: [
          CurvedNavigationBarItem(
              child: SvgPicture.asset("assets/icons/home/learn.svg"),
              label: 'التعلم',
              labelStyle: AppTextStyle.textStyleNormal15),
          CurvedNavigationBarItem(
              child: SvgPicture.asset("assets/icons/home/games.svg"),
              label: 'الالعاب',
              labelStyle: AppTextStyle.textStyleNormal15),
          CurvedNavigationBarItem(
              child: SvgPicture.asset("assets/icons/home/to do.svg"),
              label: 'المهام',
              labelStyle: AppTextStyle.textStyleNormal15),
          CurvedNavigationBarItem(
              child: SvgPicture.asset("assets/icons/home/profile.svg"),
              label: 'الملف',
              labelStyle: AppTextStyle.textStyleNormal15),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          });
        },
      ),
    );
  }
}
