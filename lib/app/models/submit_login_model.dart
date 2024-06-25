class SubmitLogin {
  String? email;
  String? password;

  SubmitLogin({this.email, this.password});

  SubmitLogin.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
