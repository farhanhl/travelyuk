class GetOrders {
  List<Order>? orders;

  GetOrders({this.orders});

  GetOrders.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Order>[];
      json['orders'].forEach((v) {
        orders?.add(Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (orders != null) {
      data['orders'] = orders?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Order {
  int? id;
  String? userId;
  String? scheduleId;
  String? pax;
  String? price;
  String? transfer;
  bool? isPaid;
  bool? isPaymentAccepted;
  bool? isRefund;
  bool? isRefundAccepted;
  bool? isOneWay;
  String? createdAt;
  String? updatedAt;
  User? user;
  Schedule? schedule;

  Order(
      {this.id,
      this.userId,
      this.scheduleId,
      this.pax,
      this.price,
      this.transfer,
      this.isPaid,
      this.isPaymentAccepted,
      this.isRefund,
      this.isRefundAccepted,
      this.isOneWay,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.schedule});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    scheduleId = json['schedule_id'];
    pax = json['pax'];
    price = json['price'];
    transfer = json['transfer'];
    isPaid = json['is_paid'];
    isPaymentAccepted = json['is_payment_accepted'];
    isRefund = json['is_refund'];
    isRefundAccepted = json['is_refund_accepted'];
    isOneWay = json['is_one_way'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User?.fromJson(json['user']) : null;
    schedule =
        json['schedule'] != null ? Schedule?.fromJson(json['schedule']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['schedule_id'] = scheduleId;
    data['pax'] = pax;
    data['price'] = price;
    data['transfer'] = transfer;
    data['is_paid'] = isPaid;
    data['is_payment_accepted'] = isPaymentAccepted;
    data['is_refund'] = isRefund;
    data['is_refund_accepted'] = isRefundAccepted;
    data['is_one_way'] = isOneWay;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user?.toJson();
    }
    if (schedule != null) {
      data['schedule'] = schedule?.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? namaLengkap;
  String? jenisKelamin;
  String? nomorTelfon;
  bool? isAdmin;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.email,
      this.namaLengkap,
      this.jenisKelamin,
      this.nomorTelfon,
      this.isAdmin,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    namaLengkap = json['nama_lengkap'];
    jenisKelamin = json['jenis_kelamin'];
    nomorTelfon = json['nomor_telfon'];
    isAdmin = json['is_admin'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['nama_lengkap'] = namaLengkap;
    data['jenis_kelamin'] = jenisKelamin;
    data['nomor_telfon'] = nomorTelfon;
    data['is_admin'] = isAdmin;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Schedule {
  int? id;
  String? originCityId;
  String? destinationCityId;
  String? seatId;
  String? date;
  String? departureTime;
  String? busName;
  String? price;
  String? createdAt;
  String? updatedAt;
  OriginCity? originCity;
  OriginCity? destinationCity;
  SeatOrders? seat;

  Schedule(
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

  Schedule.fromJson(Map<String, dynamic> json) {
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
    seat = json['seat'] != null ? SeatOrders?.fromJson(json['seat']) : null;
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

class SeatOrders {
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

  SeatOrders(
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

  SeatOrders.fromJson(Map<String, dynamic> json) {
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
