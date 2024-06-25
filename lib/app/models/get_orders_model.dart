class GetOrders {
  List<Orders>? orders;

  GetOrders({this.orders});

  GetOrders.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders?.add(Orders.fromJson(v));
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

class Orders {
  int? id;
  int? userId;
  int? scheduleId;
  String? paymentStatus;
  String? createdAt;
  String? updatedAt;
  User? user;
  Schedule? schedule;

  Orders(
      {this.id,
      this.userId,
      this.scheduleId,
      this.paymentStatus,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.schedule});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    scheduleId = json['schedule_id'];
    paymentStatus = json['payment_status'];
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
    data['payment_status'] = paymentStatus;
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
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.email,
      this.namaLengkap,
      this.jenisKelamin,
      this.nomorTelfon,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    namaLengkap = json['nama_lengkap'];
    jenisKelamin = json['jenis_kelamin'];
    nomorTelfon = json['nomor_telfon'];
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
