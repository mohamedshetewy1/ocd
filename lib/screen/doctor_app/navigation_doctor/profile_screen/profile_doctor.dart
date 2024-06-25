import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ocdear/components/main_button.dart';
import 'package:ocdear/components/password_field.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/profile_screen/widget/profile_menu.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/profile_screen/widget/show_dialogs/change_email_dialog.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/profile_screen/widget/show_dialogs/change_password_dialog.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/profile_screen/widget/show_dialogs/logout_dialog.dart';
import 'package:ocdear/screen/auth/login_screens/forget_password.dart';
import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

class DoctorsProfile extends StatefulWidget {
  const DoctorsProfile({super.key});

  @override
  State<DoctorsProfile> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<DoctorsProfile> {
  bool isPasswordSecure = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                height: 220,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 25,
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 55,
                            backgroundImage:
                                AssetImage('assets/images/doctors.png'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "إسم المستخدم ",
                            style: AppTextStyle.textStyle22,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 350,
                height: 400,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  children: [
                    const Gap(20),
                    ProfileMenu(
                      icon: "assets/icons/profile/CameraRotate.svg",
                      text: "تغيير الصورة الشخصيه",
                      press: () {},
                      withDivider: true,
                    ),
                    ProfileMenu(
                      icon: "assets/icons/profile/UserList.svg",
                      text: "تغيير الإسم",
                      press: () {},
                      withDivider: true,
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
                                        if (value == null || value.isEmpty) {
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
                                      controller: confirmPasswordController,
                                      text: "تأكيد كلمة المرور",
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Password is required";
                                        }
                                        if (value != passwordController.text) {
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
                                        if (formKey.currentState?.validate() ??
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
            ],
          ),
        ),
      ),
    );
  }
}
