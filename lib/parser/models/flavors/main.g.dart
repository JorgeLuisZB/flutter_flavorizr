// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

App _$AppFromJson(Map json) {
  $checkKeys(
    json,
    requiredKeys: const ['name', 'primary', 'secondary'],
    disallowNullValues: const ['name', 'icon', 'primary', 'secondary'],
  );
  return App(
    name: json['name'] as String,
    icon: json['icon'] as String?,
    primary: json['primary'] as String,
    secondary: json['secondary'] as String,
  );
}
