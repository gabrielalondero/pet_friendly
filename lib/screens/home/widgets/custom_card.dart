import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 162,
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 128,
              width: 160,
              decoration: const BoxDecoration(
                color: Color(0xFFFFC9C9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6),
                  bottomLeft: Radius.circular(6),
                ),
              ),
            ),
            Container(
              height: 162,
              width: 153,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(15)),
            ),
          ],
        ));
  }
}
