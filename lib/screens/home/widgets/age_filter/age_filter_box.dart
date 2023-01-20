import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_friendly/models/age_model.dart';
import 'package:pet_friendly/shared/all_colors.dart';
import 'package:pet_friendly/stores/home_store.dart';

class AgeFilterBox extends StatelessWidget {
  AgeFilterBox({super.key, required this.age});

  final AgeModel age;
  final HomeStore homeStore = GetIt.I<HomeStore>();

  @override
  Widget build(BuildContext context) {
    final color = AllColors();
    return Observer(builder: (_) {
      return GestureDetector(
        onTap: () {
          homeStore.setAgeFilter(age.title);
        },
        child: Container(
          height: 79,
          width: 73,
          margin: const EdgeInsets.only(right: 7, left: 7),
          decoration: BoxDecoration(
            color: color.white,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow:[
              homeStore.selectedAgeFilter == age.title ? 
              BoxShadow(color: Color(0xFFFFC9C9), blurRadius: 4, offset: Offset(0,4)) 
              : BoxShadow(color: Colors.transparent),
              ]
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
        ),
      );
    });
  }
}
