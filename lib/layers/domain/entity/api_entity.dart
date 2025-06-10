class ApiEntity {
  ApiEntity({required this.title, required this.body});
  String title;
  String body;


  factory ApiEntity.fromJson(Map<String, dynamic> json) {
    return ApiEntity(
      title: json['title'], 
      body: json['body']);
  }

  Map<String, dynamic> toJson() => {
    'title': this.title,
    'body': this.body,
  };
}
