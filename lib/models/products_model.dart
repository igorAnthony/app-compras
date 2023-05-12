class Products {
  int? id;
  String? name;
  String? description;
  Null image;
  String? price;
  int? stars;
  String? location;
  Null createdAt;
  Null updatedAt;

  Products(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.price,
      this.stars,
      this.location,
      this.createdAt,
      this.updatedAt});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    stars = json['stars'];
    location = json['location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
