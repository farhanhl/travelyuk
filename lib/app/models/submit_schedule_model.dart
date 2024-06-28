class SubmitSchedule {
  int? originCityId;
  int? destinationCityId;
  String? date;
  String? departureTime;
  String? busName;
  double? price;

  SubmitSchedule(
      {this.originCityId,
      this.destinationCityId,
      this.date,
      this.departureTime,
      this.busName,
      this.price});

  SubmitSchedule.fromJson(Map<String, dynamic> json) {
    originCityId = json['origin_city_id'];
    destinationCityId = json['destination_city_id'];
    date = json['date'];
    departureTime = json['departure_time'];
    busName = json['bus_name'];
    price = (json['price'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['origin_city_id'] = originCityId;
    data['destination_city_id'] = destinationCityId;
    data['date'] = date;
    data['departure_time'] = departureTime;
    data['bus_name'] = busName;
    data['price'] = price;
    return data;
  }
}
