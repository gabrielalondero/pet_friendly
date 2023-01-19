import 'package:flutter/material.dart';
import 'package:pet_friendly/models/age_model.dart';
import 'package:pet_friendly/shared/colors.dart'  as color;

class AgeFilterBox extends StatelessWidget {
  const AgeFilterBox({super.key, required this.age});

  final AgeModel age;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 79,
      width: 73,
      margin: const EdgeInsets.only(right: 7, left: 7),
      decoration: BoxDecoration(
        color: color.white,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        //boxShadow: [BoxShadow(color: Color(0xFFFFC9C9), blurRadius: 4, offset: Offset(0,4))]
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          children: [
            Image.asset(
              age.image,
              height: 40,
              width: 40,
            ),
            Expanded(
                child: Center(
              child: Text(
                age.title,
                style: TextStyle(color: color.textColor, fontSize: 12),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
