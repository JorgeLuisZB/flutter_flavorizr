// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Theme _$ThemeFromJson(Map json) {
  $checkKeys(
    json,
    requiredKeys: const [],
    disallowNullValues: const [
      'primary',
      'primaryContainer',
      'surface',
      'background',
      'secondary',
      'secondaryContainer',
      'error',
      'onPrimary',
      'onSecondary',
      'onSurface',
      'onBackground',
      'onError',
      'brightness',
      'selectedCarText',
      'unselectedCarText',
      'navbarSelected',
      'navbarUnselected',
      'navbarBackground',
      'tabsBackground',
      'gloveboxMultidocsAccent'
    ],
  );
  return Theme(
    primary: json['primary'] as String?,
    primaryContainer: json['primaryContainer'] as String?,
    surface: json['surface'] as String?,
    background: json['background'] as String?,
    secondary: json['secondary'] as String?,
    secondaryContainer: json['secondaryContainer'] as String?,
    error: json['error'] as String?,
    onPrimary: json['onPrimary'] as String?,
    onSecondary: json['onSecondary'] as String?,
    onSurface: json['onSurface'] as String?,
    onBackground: json['onBackground'] as String?,
    onError: json['onError'] as String?,
    brightness: json['brightness'] as String?,
    selectedCarText: json['selectedCarText'] as String?,
    unselectedCarText: json['unselectedCarText'] as String?,
    navbarSelected: json['navbarSelected'] as String?,
    navbarUnselected: json['navbarUnselected'] as String?,
    navbarBackground: json['navbarBackground'] as String?,
    tabsBackground: json['tabsBackground'] as String?,
    gloveboxMultidocsAccent: json['gloveboxMultidocsAccent'] as String?,
  );
}
