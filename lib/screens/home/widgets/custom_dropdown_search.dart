import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_friendly/shared/all_colors.dart';
import 'package:pet_friendly/stores/home_store.dart';

class CustomDropdownSearch extends StatelessWidget {
  CustomDropdownSearch({super.key});

  final color = AllColors();
  final HomeStore homeStore = GetIt.I<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      padding: const EdgeInsets.only(right: 3, left: 3),
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
      child: DropdownSearch<String>(
        popupProps: PopupProps.menu(
          menuProps: MenuProps(borderRadius: BorderRadius.circular(10)),
          searchFieldProps: TextFieldProps(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: InputDecoration(
                hintText: 'Search an option',
                focusColor: Colors.amber,
                hintStyle: TextStyle(color: color.greyLight, fontSize: 12),
              )),
          showSearchBox: true,
          showSelectedItems: true,
        ),
        dropdownButtonProps:
            const DropdownButtonProps(padding: EdgeInsets.zero),
        items: homeStore
            .typesList, //['All',"cat", "dog", "bird", 'horse', 'rabbit'],
        onChanged: (value) {
          if (value != null) {
            homeStore.setTypeFilter(value);
          }
        },
        selectedItem: 'All',
        dropdownDecoratorProps: _dropdownDecoratorProps(),
      ),
    );
  }


  
  DropDownDecoratorProps _dropdownDecoratorProps() {
    return DropDownDecoratorProps(
      baseStyle: TextStyle(color: color.textColor),
      dropdownSearchDecoration: InputDecoration(
        border: InputBorder.none,
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
    );



  }
}
