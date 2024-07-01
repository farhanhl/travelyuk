class SubmitOrder {
  int? userId;
  int? scheduleId;
  int? pax;
  String? price;
  bool? isOneWay;

  SubmitOrder({
    this.userId,
    this.scheduleId,
    this.pax,
    this.price,
    this.isOneWay,
  });

  SubmitOrder.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    scheduleId = json['schedule_id'];
    pax = json['pax'];
    price = json['price'];
    isOneWay = json['is_one_way'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = userId;
    data['schedule_id'] = scheduleId;
    data['pax'] = pax;
    data['price'] = price;
    data['is_one_way'] = isOneWay;
    return data;
  }
}
