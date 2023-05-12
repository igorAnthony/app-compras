class PaymentVoucher {
  int? productId;
  String? productName;
  int? quantity;
  int? totalPrice;

  PaymentVoucher(
      {this.productId, this.productName, this.quantity, this.totalPrice});

  PaymentVoucher.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    quantity = json['quantity'];
    totalPrice = json['total_price'];
  }
}