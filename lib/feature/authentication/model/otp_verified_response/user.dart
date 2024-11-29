import 'package:intl/intl.dart';

class User {
  int? id;
  String? fullName;
  String? email;
  String? phone;
  String? secondaryPhone;
  String? currentAddress;
  int? city;
  int? country;
  int? province;
  int? postalCode;
  int? latitude;
  int? longitude;
  String? website;
  String? profileImage;
  String? gender;
  DateFormat? dateOfBirth;
  String? role;
  String? companyName;
  DateFormat? establishedDate;
  bool? isEmailVerified;
  bool? isPhoneVerified;

  User(
      {required this.id,
      this.fullName,
      this.email,
      this.phone,
      this.secondaryPhone,
      this.currentAddress,
      this.city,
      this.country,
      this.province,
      this.postalCode,
      this.latitude,
      this.longitude,
      this.website,
      this.profileImage,
      this.gender,
      this.dateOfBirth,
      this.role,
      this.companyName,
      this.establishedDate,
      this.isEmailVerified = false,
      this.isPhoneVerified = false});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    secondaryPhone = json['secondary_phone'];
    currentAddress = json['current_address'];
    city = json['city'];
    country = json['country'];
    province = json['province'];
    postalCode = json['postal_code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    website = json['website'];
    profileImage = json['profile_image'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    role = json['role'];
    companyName = json['company_name'];
    establishedDate = json['established_date'];
    isEmailVerified = json['is_email_verified'];
    isPhoneVerified = json['is_phone_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['secondary_phone'] = this.secondaryPhone;
    data['current_address'] = this.currentAddress;
    data['city'] = this.city;
    data['country'] = this.country;
    data['province'] = this.province;
    data['postal_code'] = this.postalCode;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['website'] = this.website;
    data['profile_image'] = this.profileImage;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['role'] = this.role;
    data['company_name'] = this.companyName;
    data['established_date'] = this.establishedDate;
    data['is_email_verified'] = this.isEmailVerified;
    data['is_phone_verified'] = this.isPhoneVerified;
    return data;
  }
}
