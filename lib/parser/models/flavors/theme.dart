/*
 * Copyright (c) 2022 MyLittleSuite
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

import 'package:json_annotation/json_annotation.dart';

part 'theme.g.dart';

@JsonSerializable(anyMap: true, createToJson: false)
class Theme {

  @JsonKey(disallowNullValue: true)
  final String? primary;

  @JsonKey(disallowNullValue: true)
  final String? primaryContainer;

  @JsonKey(disallowNullValue: true)
  final String? surface;

  @JsonKey(disallowNullValue: true)
  final String? background;

  @JsonKey(disallowNullValue: true)
  final String? secondary;

  @JsonKey(disallowNullValue: true)
  final String? secondaryContainer;

  @JsonKey(disallowNullValue: true)
  final String? error;

  @JsonKey(disallowNullValue: true)
  final String? onPrimary;

  @JsonKey(disallowNullValue: true)
  final String? onSecondary;

  @JsonKey(disallowNullValue: true)
  final String? onSurface;

  @JsonKey(disallowNullValue: true)
  final String? onBackground;

  @JsonKey(disallowNullValue: true)
  final String? onError;

  @JsonKey(disallowNullValue: true)
  final String? brightness;

  @JsonKey(disallowNullValue: true)
  final String? selectedCarText;

  @JsonKey(disallowNullValue: true)
  final String? unselectedCarText;

  @JsonKey(disallowNullValue: true)
  final String? navbarSelected;

  @JsonKey(disallowNullValue: true)
  final String? navbarUnselected;

  @JsonKey(disallowNullValue: true)
  final String? navbarBackground;

  @JsonKey(disallowNullValue: true)
  final String? tabsBackground;


  Theme({
    this.primary,
    this.primaryContainer,
    this.surface,
    this.background,
    this.secondary,
    this.secondaryContainer,
    this.error,
    this.onPrimary,
    this.onSecondary,
    this.onSurface,
    this.onBackground,
    this.onError,
    this.brightness,
    this.selectedCarText,
    this.unselectedCarText,
    this.navbarSelected,
    this.navbarUnselected,
    this.navbarBackground,
    this.tabsBackground,
  });

  factory Theme.fromJson(Map<String, dynamic> json) => _$ThemeFromJson(json);
}
