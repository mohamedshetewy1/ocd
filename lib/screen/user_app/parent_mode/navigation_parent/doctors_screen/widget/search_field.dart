import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 243, 243, 243),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: const Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "ابحث عن الطبيب",
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
        ),
      ),
    );
  }
}
