class GetOrder {
  Order? orders;

  GetOrder({this.orders});

  GetOrder.fromJson(Map<String, dynamic> json) {
    orders = json['orders'] != null ? Order?.fromJson(json['orders']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (orders != null) {
      data['orders'] = orders?.toJson();
    }
    return data;
  }
}

class Order {
  int? id;
  int? userId;
  int? scheduleId;
  String? pax;
  String? price;
  bool? isPaid;
  bool? isPaymentAccepted;
  bool? isRefund;
  bool? isRefundAccepted;
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
      this.isPaid,
      this.isPaymentAccepted,
      this.isRefund,
      this.isRefundAccepted,
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
    isPaid = json['is_paid'];
    isPaymentAccepted = json['is_payment_accepted'];
    isRefund = json['is_refund'];
    isRefundAccepted = json['is_refund_accepted'];
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
    data['is_paid'] = isPaid;
    data['is_payment_accepted'] = isPaymentAccepted;
    data['is_refund'] = isRefund;
    data['is_refund_accepted'] = isRefundAccepted;
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

  Schedule(
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

  Schedule.fromJson(Map<String, dynamic> json) {
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
