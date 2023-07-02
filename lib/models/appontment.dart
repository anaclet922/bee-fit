class AppointmentModel {
  String id;
  String name;
  String phone;
  String email;
  String topic;
  String date;
  String time;

  AppointmentModel(
      {required this.id,
        required this.name,
        required this.phone,
        required this.email,
        required this.topic,
        required this.date,
        required this.time});

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
    'phone': phone,
    'email': email,
    'topic': topic,
    'date': date,
    'time': time
  };
}
