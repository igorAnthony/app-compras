class OrdersItems {
  int? id;
  int? orderId;
  int? productId;
  int? quantity;
  String? totalPrice;
  Null createdAt;
  Null updatedAt;

  OrdersItems(
      {this.id,
      this.orderId,
      this.productId,
      this.quantity,
      this.totalPrice,
      this.createdAt,
      this.updatedAt});

  OrdersItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    totalPrice = json['total_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['total_price'] = this.totalPrice;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}