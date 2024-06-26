class SubmitLogin {
  String? email;
  String? password;
  bool? isAdmin;

  SubmitLogin({this.email, this.password, this.isAdmin});

  SubmitLogin.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    isAdmin = json['is_admin'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['is_admin'] = isAdmin;
    return data;
  }
}
