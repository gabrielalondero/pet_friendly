// ignore_for_file: public_member_api_docs, sort_constructors_first
class TypeModel {
  Map<String, String> typesMap;

  TypeModel({
    required this.typesMap,
  });

  factory TypeModel.fromJson(List json) {
    Map<String, String> map = {'All': ''};
    json.forEach((e) {
      String type = e['name'];
      type = type.replaceAll(RegExp(r'(,|&)'), '-').replaceAll(' ', '');
      map[e['name']] = type;
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

  String filterStringToParameter(String type) {
    String parameter = '';
    typesMap.forEach((key, value) {
      if (type == key) {
        parameter = value;
      }
    });
    return parameter;
  }
}
