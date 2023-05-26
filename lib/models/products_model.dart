class Products {
  int? id;
  String? name;
  String? description;
  int? id_category;
  String? image;
  double? price;
  int? stars;
  String? location;
  String? visibility;

  Products({
    this.id,
    this.name,
    this.description,
    this.id_category,
    this.image,
    this.price,
    this.stars,
    this.location,
    this.visibility,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    id_category = json['id_category'];
    image = json['image'];
    price = double.parse(json['price'].toString());
    stars = json['stars'];
    location = json['location'];
    visibility = json['visibility'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['id_category'] = this.id_category;
    data['image'] = this.image;
    data['price'] = this.price;
    data['stars'] = this.stars;
    data['location'] = this.location;
    data['visibility'] = this.visibility;
    return data;
  }
}
