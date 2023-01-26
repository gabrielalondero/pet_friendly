class TypeModel {
  Map<String, String> typesMap;

  TypeModel({
    required this.typesMap,
  });

  factory TypeModel.fromJson(List json) {
    Map<String, String> map = {'All': ''};
    json.forEach((e) {
      String type = e['name'];
      map[type] = type.replaceAll(RegExp(r'(,|&)'), '-').replaceAll(' ', '');
    });
    return TypeModel(typesMap: map);
  }

  List<String> mapToFilterList() {
    List<String> typeList = [];
    typesMap.forEach((key, value) {
      typeList.add(key);
    });
    print(typesMap);
    return typeList;
  }

  String? filterStringToParameter(String type) {
    String? parameter;
    typesMap.forEach((key, value) {
      if (type == key) {
        parameter = value;
      }
    });
    return parameter;
  }
}
