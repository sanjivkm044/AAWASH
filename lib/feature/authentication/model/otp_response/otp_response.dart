class OtpResponse {
  final String identifier;
  final String type;
  final String role;

  // Constructor with required named parameters
  OtpResponse({
    required this.identifier,
    required this.type,
    required this.role,
  });

  // Factory constructor to handle JSON deserialization
  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(
      identifier: json['identifier'] as String,
      type: json['type'] as String,
      role: json['role'] as String,
    );
  }

  // Method to convert the object to JSON
  Map<String, dynamic> toJson() {
    return {
      'identifier': identifier,
      'type': type,
      'role': role,
    };
  }
}
