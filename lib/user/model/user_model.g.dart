// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      name: json['name'] as String,
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      phone: json['phone'] as String,
      point: (json['point'] as num).toInt(),
      available: json['available'] as bool,
      role: json['role'] as String,
      profileImageUrl: json['profileImageUrl'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'point': instance.point,
      'available': instance.available,
      'role': instance.role,
      'profileImageUrl': instance.profileImageUrl,
    };

SignupUser _$SignupUserFromJson(Map<String, dynamic> json) => SignupUser(
      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      detailAddress: json['detailAddress'] as String,
    );

Map<String, dynamic> _$SignupUserToJson(SignupUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'detailAddress': instance.detailAddress,
    };

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      address: json['address'] as String,
      detailAddress: json['detailAddress'] as String,
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'address': instance.address,
      'detailAddress': instance.detailAddress,
    };
