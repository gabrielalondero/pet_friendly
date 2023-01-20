import 'package:flutter/material.dart';
import 'package:pet_friendly/shared/all_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final color = AllColors();
    return Container(
      height: 43,
      padding: const EdgeInsets.only(right: 14, left: 3),
      decoration: BoxDecoration(
          color: color.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 4,
              color: Color.fromARGB(60, 0, 0, 0),
            )
          ]),
      child: TextField(
        style: TextStyle(color: color.textColor),
        cursorColor: color.pink,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 3),
          floatingLabelStyle: TextStyle(color: color.pink, fontSize: 14),
          prefixIcon: Icon(
            Icons.search,
            color: color.pink,
            size: 24,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: InputBorder.none,
          labelText: 'Find your new friend',
          labelStyle: TextStyle(color: color.greyLight, fontSize: 12),
          hintText: 'E.g.: cat',
          hintStyle: TextStyle(color: color.greyLight, fontSize: 12),
        ),
      ),
    );
  }
}
