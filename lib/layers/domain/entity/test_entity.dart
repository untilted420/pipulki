class TestEntity {
  TestEntity({required this.id, required this.name, required this.lastname});
  var id;
  String name;
  String lastname;

  Map<String, Object?> toMap() {
    return {'id': id, 'name': name, 'lastname': lastname};
  }

  factory TestEntity.fromMap(Map<String, dynamic> json) => TestEntity(
    id: json['id'],
    name: json['name'],
    lastname: json['lastname'],
  );

  factory TestEntity.fromJson(Map<String, dynamic> json) {
    return TestEntity(
      id: json['id'], 
      name: json['name'],
      lastname: json['lastname'],
      );
  }

  Map<String, dynamic> toJson() => {
    'id': this.id,
    'name': this.name,
    'lastname': this.lastname,
  };
}
