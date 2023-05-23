class Products {
  int? id;
  String? name;
  String? description;
  String? image;
  String? price;
  int? stars;
  String? location;
  String? visibility;


  Products({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.stars,
    this.location,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    stars = json['stars'];
    location = json['location'];
    visibility = json['visibility'];
  }
}
