import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      padding: const EdgeInsets.only(right: 14, left: 3),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 4,
              color: Color.fromARGB(60, 0, 0, 0),
            )
          ]),
      child: const TextField(
        style: TextStyle(color: Color(0xFF342D2D)),
        cursorColor: Color(0xFFFF6F7F),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 3),
          floatingLabelStyle: TextStyle(color: Color(0xFFFF6F7F), fontSize: 14),
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xFFFF6F7F),
            size: 24,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: InputBorder.none,
          labelText: 'Find your new friend',
          labelStyle: TextStyle(color: Color(0xFF858585), fontSize: 12),
          hintText: 'E.g.: cat',
          hintStyle: TextStyle(color: Color(0xFF858585), fontSize: 12),
        ),
      ),
    );
  }
}
