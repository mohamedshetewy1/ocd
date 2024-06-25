import 'package:flutter/material.dart';
import 'package:ocdear/components/main_button.dart';
import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

// class ChangePasswordDialog extends StatefulWidget {
//   const ChangePasswordDialog({super.key});

//   @override
//   State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
// }

// class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
//   @override
//   Widget build(BuildContext context) {
//     return showDialog(
//                     context: context,
//                     builder: (context) => Dialog(
//                       child: Container(
//                         padding: const EdgeInsets.all(16),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         height: 500,
//                         width: 328,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Text(
//                               "تغيير كلمة المرور",
//                               style: AppTextStyle.textStyle16w500,
//                             ),
//                             SizedBox(
//                               height: 70,
//                               child: PasswordFormField(
//                                 controller: passwordController,
//                                 text: "كلمة المرور الجديدة",
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return "Password is required";
//                                   }
//                                   return null;
//                                 },
//                                 type: TextInputType.visiblePassword,
//                                 action: TextInputAction.next,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 70,
//                               child: PasswordFormField(
//                                 controller: confirmPasswordController,
//                                 text: "تأكيد كلمة المرور",
//                                 validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return "Password is required";
//                                   }
//                                   if (value != passwordController.text) {
//                                     return "Passwords don't match";
//                                   }
//                                   return null;
//                                 },
//                                 type: TextInputType.visiblePassword,
//                                 action: TextInputAction.done,
//                               ),
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) =>
//                                         const ForgetPassword(),
//                                   ),
//                                 );
//                               },
//                               child: const Text(
//                                 "هل نسيت كلمة المرور ؟",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: AppColors.normalActive,
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w400,
//                                     fontFamily: "ReadexPro"),
//                               ),
//                             ),
//                             SizedBox(
//                               width: double.infinity,
//                               height: 47,
//                               child: MainButton(
//                                 text: "تغيير",
//                                 function: () {
//                                   if (formKey.currentState?.validate() ??
//                                       false) {
//                                     passwordChangedDialog(context);
//                                   }
//                                 },
//                                 buttonColor: AppColors.normalActive,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                   ;
//   }
// }

void passwordChangedDialog(BuildContext context, {Function()? function}) {
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 135,
              height: 135,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.normalActive,
              ),
              child: const Icon(
                Icons.check,
                size: 80,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "! تهانينا",
              style: AppTextStyle.textStyle22,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "تم تغيير كلمة المرور بنجاح",
              textAlign: TextAlign.center,
              style: AppTextStyle.textStyleGrey14,
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              height: 47,
              child: MainButton(
                text: "رجوع",
                function: () {
                  Navigator.of(context).pop();
                },
                buttonColor: AppColors.normalActive,
              ),
            )
          ],
        ),
      ),
    ),
  );
}
