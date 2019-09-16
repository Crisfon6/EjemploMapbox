// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      number: json['number'] as int, password: json['password'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) =>
    <String, dynamic>{'password': instance.password, 'number': instance.number};
