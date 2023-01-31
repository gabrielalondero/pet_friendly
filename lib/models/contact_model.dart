
class ContactModel {
  String email = '';
  String phone = '';
  String city = '';
  String state = '';
  String country = '';
  
  ContactModel({
    required this.email,
    required this.phone,
    required this.city,
    required this.state,
    required this.country,
  });


  factory ContactModel.fromJson(Map<String, dynamic> json) {
    String defaultInfo = 'Not informed';
    return ContactModel(
      email: json['email'] ?? defaultInfo,
      phone: json['phone'] ?? defaultInfo,
      city: json['address']['city'] ?? '',
      state: json['address']['state'] ?? '',
      country: json['address']['country'] ?? '',
    );
  }


  @override
  String toString() {
    return 'Contact(email: $email, phone: $phone, city: $city, state: $state, country: $country)';
  }
}
