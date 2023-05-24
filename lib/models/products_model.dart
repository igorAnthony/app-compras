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
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    data['stars'] = this.stars;
    data['location'] = this.location;
    data['visibility'] = this.visibility;
    return data;
  }
}
