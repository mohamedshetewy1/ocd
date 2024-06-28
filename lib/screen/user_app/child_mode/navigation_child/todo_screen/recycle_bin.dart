import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ocdear/screen/user_app/child_mode/navigation_child/todo_screen/model/task_model.dart';
import 'package:ocdear/utils/text_style.dart';

class RecycleBin extends StatelessWidget {
  RecycleBin({super.key});
  List<TasksModel> tasks = [];
  static const id = 'recycle_bin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'قائمة المهام',
            style: AppTextStyle.textStyleNormal20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DottedBorder(
                borderType: BorderType.RRect,
                color: Colors.black,
                radius: const Radius.circular(5),
                borderPadding: const EdgeInsets.all(1),
                child: ElevatedButton(
                  onPressed: () {
                    // _showAddTaskDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(double.maxFinite, 54),
                    foregroundColor: Colors.grey,
                    backgroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Spacer(),
                      Text('إضافة مهمة جديدة',
                          style: AppTextStyle.textStyleGrey16),
                      SizedBox(width: 5),
                      Icon(
                        Icons.add,
                        size: 30,
                        color: Color(0xff737373),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            if (tasks.isNotEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'اليوم',
                  style: AppTextStyle.textStyleBold18,
                ),
              ),
            const Column(
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
