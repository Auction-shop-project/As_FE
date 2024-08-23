
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

abstract class UserModelBase{}

class UserModelError extends UserModelBase{
  final String msg;

  UserModelError({
    required this.msg,
  });
}

class UserModelLoading extends UserModelBase{}

class UserModelSignup extends UserModelBase{
  final int id;

  UserModelSignup({
    required this.id,
  });
}

@JsonSerializable()
class UserModel extends UserModelBase{
  final int id;
  final String username;
  final String name;
  final String nickname;
  final String email;
  final List<AddressModel> address;
  final String phone;
  final int point;
  final bool available;
  final String role;
  final String? profileImageUrl;

  UserModel({
    required this.id,
    required this.username,
    required this.name,
    required this.nickname,
    required this.email,
    required this.address,
    required this.phone,
    required this.point,
    required this.available,
    required this.role,
    this.profileImageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

@JsonSerializable()
class SignupUser{
  final String name;
  final String nickname;
  final String zipcode;
  final String email;
  final String phone;
  final String address;
  final String detailAddress;

  SignupUser({
    required this.name,
    required this.nickname,
    required this.zipcode,
    required this.email,
    required this.phone,
    required this.address,
    required this.detailAddress,
  });

  Map<String, dynamic> toJson() => _$SignupUserToJson(this);

  factory SignupUser.fromJson(Map<String, dynamic> json) => _$SignupUserFromJson(json);
}

@JsonSerializable()
class AddressModel{
  final int id;
  final String name;
  final String phoneNumber;
  final bool defaultAddress;
  final String address;
  final String detailAddress;
  final String zipcode;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.defaultAddress,
    required this.address,
    required this.detailAddress,
    required this.zipcode,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);
}