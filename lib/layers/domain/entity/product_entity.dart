class ProductEntity {
  ProductEntity({required this.name, required this.price, required this.id, required this.category});
  String name;
  int price;
  int id;
  int category;

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      name: json['title'],
      price: json['price'],
      id: json['imageUrl'],
      category: json['category']
    );
  }

  Map<String, dynamic> toJson() => {
    'name': this.name,
    'price': this.price,
    'id': this.id,
    'category': this.category,
  };
}
