class Orders {
  int? id;
  int? customerId;
  String? totalAmount;
  String? orderStatus;
  Null createdAt;
  Null updatedAt;

  Orders(
      {this.id,
      this.customerId,
      this.totalAmount,
      this.orderStatus,
      this.createdAt,
      this.updatedAt});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    totalAmount = json['total_amount'];
    orderStatus = json['order_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['total_amount'] = this.totalAmount;
    data['order_status'] = this.orderStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}