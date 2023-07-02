class FaqModel {
  String id;
  String title;
  String body;

  FaqModel(
      {required this.id,
        required this.title,
        required this.body});

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'title': title,
    'body': body
  };
}
