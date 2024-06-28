class SubmitOrder {
  int? userId;
  int? scheduleId;
  String? paymentStatus;
  int? pax;
  String? price;

  SubmitOrder(
      {this.userId, this.scheduleId, this.paymentStatus, this.pax, this.price});

  SubmitOrder.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    scheduleId = json['schedule_id'];
    paymentStatus = json['payment_status'];
    pax = json['pax'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = userId;
    data['schedule_id'] = scheduleId;
    data['payment_status'] = paymentStatus;
    data['pax'] = pax;
    data['price'] = price;
    return data;
  }
}
