class GetLogin {
  UserGetLogin? user;
  String? message;

  GetLogin({this.user, this.message});

  GetLogin.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? UserGetLogin?.fromJson(json['user']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user?.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class UserGetLogin {
  int? id;
  String? email;
  String? namaLengkap;
  String? jenisKelamin;
  String? nomorTelfon;
  bool? isAdmin;
  String? createdAt;
  String? updatedAt;

  UserGetLogin(
      {this.id,
      this.email,
      this.namaLengkap,
      this.jenisKelamin,
      this.nomorTelfon,
      this.isAdmin,
      this.createdAt,
      this.updatedAt});

  UserGetLogin.fromJson(Map<String, dynamic> json) {
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
