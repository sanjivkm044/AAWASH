class SentOtpResponseModel {
  String? message;
  String? token;
  String? expiresAt;

  SentOtpResponseModel({
    required this.message,
    required this.token,
    required this.expiresAt,
  });

  SentOtpResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    expiresAt = json['expiresAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['token'] = token;
    data['expiresAt'] = expiresAt;
    return data;
  }
}
