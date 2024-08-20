class PaymentProof {
  bool? success;
  String? message;
  String? path;

  PaymentProof({this.success, this.message, this.path});

  PaymentProof.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['path'] = path;
    return data;
  }
}
