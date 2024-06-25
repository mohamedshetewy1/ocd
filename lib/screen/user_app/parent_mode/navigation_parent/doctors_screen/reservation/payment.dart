import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ocdear/screen/user_app/parent_mode/navigation_parent/doctors_screen/reservation/payment_num.dart';
import 'package:ocdear/utils/colors.dart';
import 'package:ocdear/utils/text_style.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          ' طرق الدفع ',
          style: AppTextStyle.textStyleNormal20,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.normalActive,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Gap(40),
              Row(
                children: [
                  Radio(
                      activeColor: AppColors.normalActive,
                      value: 1,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                      }),
                  const Gap(10),
                  const Text(
                    "فودافون كاش و المحافظ الإلكترونية",
                    style: AppTextStyle.textStyleBlack14,
                  )
                ],
              ),
              const Gap(40),
              Row(
                children: [
                  Radio(
                      activeColor: AppColors.normalActive,
                      value: 2,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                      }),
                  const Gap(10),
                  const Text(
                    "فوري",
                    style: AppTextStyle.textStyleBlack14,
                  )
                ],
              ),
              const Gap(40),
              Row(
                children: [
                  Radio(
                      activeColor: AppColors.normalActive,
                      value: 3,
                      groupValue: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value!;
                        });
                      }),
                  const Gap(10),
                  const Text(
                    "البطاقات المحلية",
                    style: AppTextStyle.textStyleBlack14,
                  )
                ],
              ),
              const Gap(40),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentNumber(),
                    ),
                  );
                },
                child: Container(
                  width: 350,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.dark,
                  ),
                  child: const Center(
                    child: Text(
                      "إستمرار ",
                      style: AppTextStyle.textStyleMain20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
