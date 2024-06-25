import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocdear/components/main_button.dart';
import 'package:ocdear/components/password_field.dart';
import 'package:ocdear/layout/layout_cubit/layout_cubit.dart';
import 'package:ocdear/layout/layout_cubit/layout_states.dart';
import 'package:ocdear/screen/intro/avatar_and_color_screen/avatar_and_color_screen.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/profile_screen/widget/profile_menu.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/profile_screen/widget/show_dialogs/change_email_dialog.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/profile_screen/widget/show_dialogs/change_password_dialog.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/profile_screen/widget/show_dialogs/logout_dialog.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/profile_screen/widget/show_dialogs/parent_mode_dialog.dart';
import 'package:ocdear/screen/auth/login_screens/forget_password.dart';
import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isPasswordSecure = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<LayoutCubit>(context).getUserData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, State) {},
        builder: (context, State) {
          return Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text(
                  'الصفحة الشخصية',
                  style: AppTextStyle.textStyleNormal20,
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              automaticallyImplyLeading: false,
            ),
            backgroundColor: const Color(0xFFFFFFFF),
            body: BlocProvider.of<LayoutCubit>(context).userModel != null
                ? SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 270,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/home/profile.jpg"),
                              ),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 67,
                                  ),
                                  child: Column(
                                    children: [
                                      // i want here the user selected picture
                                      const CircleAvatar(
                                        radius: 45,
                                        backgroundImage: AssetImage(
                                            'assets/images/home/Ellipse 69.png'),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        BlocProvider.of<LayoutCubit>(context)
                                                .userModel
                                                ?.name ??
                                            "",
                                        style: AppTextStyle.textStyle22,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ProfileMenu(
                            icon: "assets/icons/profile/Envelope.svg",
                            text: "تغيير البريد الإلكتروني",
                            press: () {
                              changeEmailDialog(context);
                            },
                            withDivider: true,
                          ),
                          ProfileMenu(
                            icon: "assets/icons/profile/UserSwitch.svg",
                            text: "التغيير الى وضع الوالدين",
                            press: () {
                              changeParentModeDialog(context);
                            },
                            withDivider: true,
                          ),
                          ProfileMenu(
                            icon: "assets/icons/profile/Lock.svg",
                            text: "تغيير كلمة المرور",
                            withDivider: true,
                            press: () {
                              showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    height: 334,
                                    width: 328,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "تغيير كلمة المرور",
                                          style: AppTextStyle.textStyle16w500,
                                        ),
                                        SizedBox(
                                          height: 70,
                                          child: PasswordFormField(
                                            controller: passwordController,
                                            text: "كلمة المرور الجديدة",
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "Password is required";
                                              }
                                              return null;
                                            },
                                            type: TextInputType.visiblePassword,
                                            action: TextInputAction.next,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 70,
                                          child: PasswordFormField(
                                            controller:
                                                confirmPasswordController,
                                            text: "تأكيد كلمة المرور",
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "Password is required";
                                              }
                                              if (value !=
                                                  passwordController.text) {
                                                return "Passwords don't match";
                                              }
                                              return null;
                                            },
                                            type: TextInputType.visiblePassword,
                                            action: TextInputAction.done,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const ForgetPassword(),
                                              ),
                                            );
                                          },
                                          child: const Text(
                                            "هل نسيت كلمة المرور ؟",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: AppColors.normalActive,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "ReadexPro"),
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          height: 47,
                                          child: MainButton(
                                            text: "تغيير",
                                            function: () {
                                              if (formKey.currentState
                                                      ?.validate() ??
                                                  false) {
                                                passwordChangedDialog(context);
                                              }
                                            },
                                            buttonColor: AppColors.normalActive,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          ProfileMenu(
                            icon: "assets/icons/profile/Palette.svg",
                            text: " تغيير لون التطبيق",
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AvatarScreen(),
                                ),
                              );
                            },
                            withDivider: true,
                          ),
                          ProfileMenu(
                            icon: "assets/icons/profile/CameraRotate.svg",
                            text: "استكمال بيانات الوالد",
                            withDivider: true,
                            press: () {},
                          ),
                          const SizedBox(
                            height: 45,
                          ),
                          ProfileMenu(
                            icon: "assets/icons/profile/SignOut.svg",
                            color: Colors.red,
                            text: "تسجيل الخروج",
                            withDivider: false,
                            press: () {
                              logoutDialog(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        });
  }
}
