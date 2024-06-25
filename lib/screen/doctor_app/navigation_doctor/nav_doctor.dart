import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ocdear/screen/doctor_app/navigation_doctor/appointments_doctor/appointments_tap.dart';
import 'package:ocdear/screen/doctor_app/navigation_doctor/profile_screen/profile_doctor.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/chat_screen/chat_screen.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:ocdear/utils/text_style.dart';

class NavDoctor extends StatefulWidget {
  const NavDoctor({Key? key}) : super(key: key);

  @override
  State<NavDoctor> createState() => _NavParentState();
}

class _NavParentState extends State<NavDoctor> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _selectedIndex,
    );
  }

  final List<Widget> _screens = [
    const AppointmentsOnLineDoctor(),
    const ChatScreen(),
    const DoctorsProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: _screens.length,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        itemBuilder: (context, index) => _screens[_selectedIndex],
      ),
      bottomNavigationBar: LayoutBuilder(
        builder: (context, constraints) {
          return CurvedNavigationBar(
            backgroundColor: Colors.white,
            index: _selectedIndex,
            items: [
              CurvedNavigationBarItem(
                  child: SvgPicture.asset("assets/icons/home/home_doc.svg",
                      fit: BoxFit.fill),
                  label: 'المواعيد',
                  labelStyle: AppTextStyle.textStyleNormal15),
              CurvedNavigationBarItem(
                  child: SvgPicture.asset("assets/icons/home/ChatsCircle.svg"),
                  label: 'محادثة',
                  labelStyle: AppTextStyle.textStyleNormal15),
              CurvedNavigationBarItem(
                child: SvgPicture.asset("assets/icons/home/profile.svg"),
                label: 'الملف',
                labelStyle: AppTextStyle.textStyleNormal15,
              ),
            ],
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              });
            },
          );
        },
      ),
    );
  }
}
