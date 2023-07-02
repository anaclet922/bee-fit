class UserModel {
  String id;
  String name;
  String dob;
  String weight;
  String height;
  String phone;
  String email;
  String role;

  UserModel(
      {required this.id,
      required this.name,
      required this.dob,
      required this.weight,
      required this.height,
      required this.phone,
      required this.email,
      required this.role});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'dob': dob,
        'weight': weight,
        'height': height,
        'phone': phone,
        'email': email,
        'role': role
      };
}
