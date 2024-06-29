class SubmitOrder {
  int? userId;
  int? scheduleId;
  int? pax;
  String? price;

  SubmitOrder({this.userId, this.scheduleId, this.pax, this.price});

  SubmitOrder.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    scheduleId = json['schedule_id'];
    pax = json['pax'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user_id'] = userId;
    data['schedule_id'] = scheduleId;
    data['pax'] = pax;
    data['price'] = price;
    return data;
  }
}
