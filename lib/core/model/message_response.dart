import 'dart:convert';

class MessageResponse {
  final String message;
  MessageResponse({
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
    };
  }

  factory MessageResponse.fromMap(Map<String, dynamic> map) {
    return MessageResponse(
      message: map['data']['message'] ?? '',
    );
  }

  factory MessageResponse.fromError(Map<String, dynamic> map) {
    return MessageResponse(message: map['error']['message'] ?? '');
  }

  factory MessageResponse.fromMessageMap(Map<String, dynamic> map) {
    return MessageResponse(message: map['message']);
  }

  String toJson() => json.encode(toMap());

  factory MessageResponse.fromJson(String source) =>
      MessageResponse.fromMap(json.decode(source));
}
