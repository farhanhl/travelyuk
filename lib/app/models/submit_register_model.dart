class SubmitRegister {
  String? email;
  String? password;
  String? namaLengkap;
  String? jenisKelamin;
  String? nomorTelfon;

  SubmitRegister(
      {this.email,
      this.password,
      this.namaLengkap,
      this.jenisKelamin,
      this.nomorTelfon});

  SubmitRegister.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    namaLengkap = json['nama_lengkap'];
    jenisKelamin = json['jenis_kelamin'];
    nomorTelfon = json['nomor_telfon'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['nama_lengkap'] = namaLengkap;
    data['jenis_kelamin'] = jenisKelamin;
    data['nomor_telfon'] = nomorTelfon;
    return data;
  }
}
