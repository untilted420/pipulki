class ItemEntity {
  ItemEntity({required this.name, required this.colorItem});

  String name;
  String colorItem;

  factory ItemEntity.fromJson(Map<String, dynamic> json) {
    return ItemEntity(
      name: json['name'], 
      colorItem: json['colorItem']);
  }

  Map<String, dynamic> toJson() => {
    'name': this.name,
    'colorItem': this.colorItem,
  };
}
