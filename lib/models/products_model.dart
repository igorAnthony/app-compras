class Products {
  int? id;
  String? name;
  String? description;
  int? id_category;
  String? image;
  double? price;
  String? visibility;

  Products({
    this.id,
    this.name,
    this.description,
    this.id_category,
    this.image,
    this.price,
    this.visibility,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    id_category = json['id_category'];
    image = json['image'];
    price = double.parse(json['price'].toString());
    visibility = json['visibility'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'id_category': id_category,
      'image': image,
      'price': price,
      'visibility': visibility,
    };
  }
}
