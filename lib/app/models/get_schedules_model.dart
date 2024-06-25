class GetSchedules {
  List<Schedules>? schedules;

  GetSchedules({this.schedules});

  GetSchedules.fromJson(Map<String, dynamic> json) {
    if (json['schedules'] != null) {
      schedules = <Schedules>[];
      json['schedules'].forEach((v) {
        schedules?.add(Schedules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (schedules != null) {
      data['schedules'] = schedules?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Schedules {
  int? id;
  int? originCityId;
  int? destinationCityId;
  String? date;
  String? departureTime;
  String? busName;
  String? price;
  String? createdAt;
  String? updatedAt;
  OriginCity? originCity;
  OriginCity? destinationCity;

  Schedules(
      {this.id,
      this.originCityId,
      this.destinationCityId,
      this.date,
      this.departureTime,
      this.busName,
      this.price,
      this.createdAt,
      this.updatedAt,
      this.originCity,
      this.destinationCity});

  Schedules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    originCityId = json['origin_city_id'];
    destinationCityId = json['destination_city_id'];
    date = json['date'];
    departureTime = json['departure_time'];
    busName = json['bus_name'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    originCity = json['origin_city'] != null
        ? OriginCity?.fromJson(json['origin_city'])
        : null;
    destinationCity = json['destination_city'] != null
        ? OriginCity?.fromJson(json['destination_city'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['origin_city_id'] = originCityId;
    data['destination_city_id'] = destinationCityId;
    data['date'] = date;
    data['departure_time'] = departureTime;
    data['bus_name'] = busName;
    data['price'] = price;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (originCity != null) {
      data['origin_city'] = originCity?.toJson();
    }
    if (destinationCity != null) {
      data['destination_city'] = destinationCity?.toJson();
    }
    return data;
  }
}

class OriginCity {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  OriginCity({this.id, this.name, this.createdAt, this.updatedAt});

  OriginCity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
