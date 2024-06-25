import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:ocdear/components/custom_text_field.dart';
import 'package:ocdear/components/google_button.dart';
import 'package:ocdear/components/main_button.dart';
import 'package:ocdear/components/main_logo.dart';
import 'package:ocdear/components/password_field.dart';
import 'package:ocdear/screen/auth/cubit/auth_cubit.dart';
import 'package:ocdear/screen/auth/login_screens/forget_password.dart';
import 'package:ocdear/screen/auth/sign_up_screen/sign_up_screen.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/nav_child.dart';

import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordSecure = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const NavChild(),
                ),
              );
            } else if (state is LoginFailedState) {
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  content: Text(
                    // state.message,
                    "unauthorized",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  backgroundColor: Colors.white,
                ),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Gap(35),
                    const MainLogo(),
                    const Text(
                      " ! مرحبا بعودتك ",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.normalActive,
                        fontFamily: "ReadexPro",
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "OCDEAR",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.normalActive,
                            fontFamily: "ReadexPro",
                          ),
                        ),
                        Text("اهلا بيك في تطبيقنا ",
                            textAlign: TextAlign.end,
                            style: AppTextStyle.textStyleBlack14),
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      text: "الايميل",
                      validator: (input) {
                        if (emailController.text.isEmpty ||
                            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                .hasMatch(input!)) {
                          return "Email isn't correct";
                        }
                        return null;
                      },
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      action: TextInputAction.next,
                    ),
                    PasswordFormField(
                      text: "كلمة المرور",
                      validator: (input) {
                        if (input == null || passwordController.text.isEmpty) {
                          return "Password is required";
                        }
                        return null;
                      },
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      action: TextInputAction.done,
                    ),
                    const SizedBox(height: 14),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgetPassword(),
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
                    const SizedBox(height: 40),
                    MainButton(
                      text: "تسجيل الدخول",
                      buttonColor: AppColors.normalActive,
                      textColor: Colors.white,
                      function: () {
                        // if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context).login(
                            email: emailController.text,
                            password: passwordController.text);
                        // }
                      },
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.greyColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "او",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.greyColor,
                            fontFamily: "ReadexPro",
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            height: 1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.greyColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const ButtonWithGoogle(),
                    const SizedBox(height: 20),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "ليس لديك حساب ؟ ",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: "ReadexPro",
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (_) => const SignUpScreen(),
                              ));
                            },
                            child: const Text(
                              "انشاء حساب",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: AppColors.normalActive,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: "ReadexPro",
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
