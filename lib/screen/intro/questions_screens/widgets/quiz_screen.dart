import 'package:flutter/material.dart';
import 'package:ocdear/components/customTextButtom.dart';
import 'package:ocdear/screen/intro/questions_screens/widgets/next_button.dart';
import 'package:ocdear/screen/intro/questions_screens/widgets/questions_model.dart';
import 'package:ocdear/screen/intro/questions_screens/widgets/result_page.dart';
import 'package:ocdear/utils/colors.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;

  List<int?> selectedChoices = List.generate(10, (_) => null);

  bool isNextButtonEnabled() {
    return selectedChoices[currentQuestionIndex] != null;
  }

  int calculateTotalGrade() {
    int total = 0;
    for (int? choice in selectedChoices) {
      if (choice != null) {
        total += choice;
      }
    }
    return total;
  }

  String interpretResult(int totalGrade) {
    if (totalGrade >= 0 && totalGrade <= 7) {
      return 'أعراض وسواس قهري خفيفة جدا. في الغالب لا تحتاج إلى العالج إلا إذا كان معدال قليال لأنك تتجنب مواقف كثيرة أو لديك أفعال قهرية فقط أو وسواس فقط.';
    } else if (totalGrade >= 8 && totalGrade <= 14) {
      return 'أعراض خفيفة والتي من المحتمل أن تتعارض في حياتك بطرق ملحوظة.';
    } else if (totalGrade >= 15 && totalGrade <= 21) {
      return 'أعراض متوسطة (أدنى مستوى للدخول في اضطراب الوسواس القهري.)';
    } else if (totalGrade >= 22 && totalGrade <= 28) {
      return 'أعراض ملحوظة (حالة المرض متوسطة)';
    } else {
      return 'أعراض شديدة والتي من المحتمل أن تسبب عجزا بالغا.';
    }
  }

  String theEndResult(int totalGrade) {
    if (totalGrade >= 0 && totalGrade <= 7) {
      return 'أعراض وسواس قهري خفيفة جدا';
    } else if (totalGrade >= 8 && totalGrade <= 14) {
      return 'أعراض وسواس قهري خفيف';
    } else if (totalGrade >= 15 && totalGrade <= 21) {
      return 'أعراض وسواس قهري متوسط';
    } else if (totalGrade >= 22 && totalGrade <= 28) {
      return 'أعراض وسواس قهري ملحوظ';
    } else {
      return 'أعراض وسواس قهري شديد';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Visibility(
            visible: currentQuestionIndex < questions.length,
            child: Column(
              children: [
                Text(
                  questions[currentQuestionIndex]['question'],
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                Column(
                  children: (questions[currentQuestionIndex]['choices']
                          as List<String>)
                      .map((choice) {
                    int index = questions[currentQuestionIndex]['choices']
                        .indexOf(choice);
                    return RadioListTile(
                      title: Text(
                        choice,
                        style: TextStyle(
                          fontFamily: "ReadexPro",
                          color: selectedChoices[currentQuestionIndex] == index
                              ? Colors.black
                              : Colors.grey,
                        ),
                      ),
                      activeColor: AppColors.normalActive,
                      value: index,
                      groupValue: selectedChoices[currentQuestionIndex],
                      onChanged: (int? value) {
                        setState(() {
                          selectedChoices[currentQuestionIndex] = value;
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SubmitQuesButton(
            function: isNextButtonEnabled()
                ? () {
                    if (currentQuestionIndex < questions.length - 1) {
                      setState(() {
                        currentQuestionIndex++;
                      });
                    } else {
                      // Navigate to ResultPage when all questions are answered
                      int totalGrade = calculateTotalGrade();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(
                            // totalGrade: totalGrade,
                            endResult: theEndResult(totalGrade),
                            resultText: interpretResult(totalGrade),
                          ),
                        ),
                      );
                    }
                  }
                : null,
            activeColor: isNextButtonEnabled()
                ? AppColors.normalActive
                : AppColors.greyColor,
            text: currentQuestionIndex == questions.length - 1
                ? 'تأكيد'
                : 'التالي',
            buttonColor: AppColors.greyColor,
            textColor: Colors.white,
          ),
          const SizedBox(height: 20),
          CustomTextButton(
            function: () {
              if (currentQuestionIndex > 0) {
                setState(() {
                  currentQuestionIndex--;
                });
              }
            },
            text: "رجوع",
            buttonColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
