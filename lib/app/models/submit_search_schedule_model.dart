class SubmitSearchSchedule {
  int? originCityId;
  int? destinationCityId;
  String? date;

  SubmitSearchSchedule({this.originCityId, this.destinationCityId, this.date});

  SubmitSearchSchedule.fromJson(Map<String, dynamic> json) {
    originCityId = json['origin_city_id'];
    destinationCityId = json['destination_city_id'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['origin_city_id'] = originCityId;
    data['destination_city_id'] = destinationCityId;
    data['date'] = date;
    return data;
  }
}
