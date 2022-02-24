// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

App _$AppFromJson(Map json) {
  $checkKeys(
    json,
    requiredKeys: const ['name'],
    disallowNullValues: const ['name', 'icon', 'theme'],
  );
  return App(
    name: json['name'] as String,
    icon: json['icon'] as String?,
    theme: Theme.fromJson(Map<String, dynamic>.from(json['theme'] as Map)),
  );
}
