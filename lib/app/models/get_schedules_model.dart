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
  int? seatId;
  String? date;
  String? departureTime;
  String? busName;
  String? price;
  String? createdAt;
  String? updatedAt;
  OriginCity? originCity;
  OriginCity? destinationCity;
  Seat? seat;

  Schedules(
      {this.id,
      this.originCityId,
      this.destinationCityId,
      this.seatId,
      this.date,
      this.departureTime,
      this.busName,
      this.price,
      this.createdAt,
      this.updatedAt,
      this.originCity,
      this.destinationCity,
      this.seat});

  Schedules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    originCityId = json['origin_city_id'];
    destinationCityId = json['destination_city_id'];
    seatId = json['seat_id'];
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
    seat = json['seat'] != null ? Seat?.fromJson(json['seat']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['origin_city_id'] = originCityId;
    data['destination_city_id'] = destinationCityId;
    data['seat_id'] = seatId;
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
    if (seat != null) {
      data['seat'] = seat?.toJson();
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

class Seat {
  int? id;
  bool? seat1;
  bool? seat2;
  bool? seat3;
  bool? seat4;
  bool? seat5;
  bool? seat6;
  bool? seat7;
  bool? seat8;
  bool? seat9;
  bool? seat10;
  bool? seat11;
  bool? seat12;
  bool? seat13;
  bool? seat14;
  bool? seat15;
  bool? seat16;
  bool? seat17;
  bool? seat18;
  bool? seat19;
  bool? seat20;
  String? createdAt;
  String? updatedAt;

  Seat(
      {this.id,
      this.seat1,
      this.seat2,
      this.seat3,
      this.seat4,
      this.seat5,
      this.seat6,
      this.seat7,
      this.seat8,
      this.seat9,
      this.seat10,
      this.seat11,
      this.seat12,
      this.seat13,
      this.seat14,
      this.seat15,
      this.seat16,
      this.seat17,
      this.seat18,
      this.seat19,
      this.seat20,
      this.createdAt,
      this.updatedAt});

  Seat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seat1 = json['seat_1'];
    seat2 = json['seat_2'];
    seat3 = json['seat_3'];
    seat4 = json['seat_4'];
    seat5 = json['seat_5'];
    seat6 = json['seat_6'];
    seat7 = json['seat_7'];
    seat8 = json['seat_8'];
    seat9 = json['seat_9'];
    seat10 = json['seat_10'];
    seat11 = json['seat_11'];
    seat12 = json['seat_12'];
    seat13 = json['seat_13'];
    seat14 = json['seat_14'];
    seat15 = json['seat_15'];
    seat16 = json['seat_16'];
    seat17 = json['seat_17'];
    seat18 = json['seat_18'];
    seat19 = json['seat_19'];
    seat20 = json['seat_20'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['seat_1'] = seat1;
    data['seat_2'] = seat2;
    data['seat_3'] = seat3;
    data['seat_4'] = seat4;
    data['seat_5'] = seat5;
    data['seat_6'] = seat6;
    data['seat_7'] = seat7;
    data['seat_8'] = seat8;
    data['seat_9'] = seat9;
    data['seat_10'] = seat10;
    data['seat_11'] = seat11;
    data['seat_12'] = seat12;
    data['seat_13'] = seat13;
    data['seat_14'] = seat14;
    data['seat_15'] = seat15;
    data['seat_16'] = seat16;
    data['seat_17'] = seat17;
    data['seat_18'] = seat18;
    data['seat_19'] = seat19;
    data['seat_20'] = seat20;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
