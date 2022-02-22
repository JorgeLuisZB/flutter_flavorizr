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

import 'package:flutter_flavorizr/parser/models/flavorizr.dart';
import 'package:flutter_flavorizr/processors/commons/string_processor.dart';
import 'package:flutter_flavorizr/utils/string_casing.dart';

class FlutterFlavorThemeProcessor extends StringProcessor {
  FlutterFlavorThemeProcessor({
    String? input,
    required Flavorizr config,
  }) : super(
    input: input,
    config: config,
  );

  @override
  String execute() {
    StringBuffer buffer = StringBuffer();

    _appendImports(buffer);
    _appendBaseTheme(buffer);
    _appendThemeData(buffer);

    return buffer.toString();
  }

  void _appendImports(StringBuffer buffer) {
    buffer.writeln('import \'package:flutter/material.dart\';');
    buffer.writeln('import \'package:connect/app/utils/flavor_config.dart\';');
    buffer.writeln();
  }

  void _appendBaseTheme(StringBuffer buffer) {
    buffer.writeln('class ThemeColor {');
    buffer.writeln('  static const Color white = Color(0xffffffff);');
    buffer.writeln('  static const Color secondaryGrey = Color(0xffF1F3F4);');
    buffer.writeln('  static const Color secondaryMediumGrey = Color(0xff0000004D);');
    buffer.writeln('  static const Color primaryBlack = Color(0xff141915);');
    buffer.writeln('  static const Color secondaryDarkGrey = Color(0xff606260);');
    buffer.writeln('  static const Color primaryDarkGrey = Color(0xff414141);');
    buffer.writeln('  static const Color primaryGreen = Color(0xff5EBE4E);');
    buffer.writeln('  static const Color primaryGrey = Color(0xffBABABA);');
    buffer.writeln('  static const Color secondaryBlack = Color(0xff2B2F2C);');
    buffer.writeln('  static const Color primaryBlue = Color(0xff239DD1);');
    buffer.writeln('  static const Color secondaryRed = Color(0xffE2173A);');
    buffer.writeln('  static const Color primaryShadowGrey = Color(0xffBABABA);');
    buffer.writeln('  static const Color primaryYellow = Color(0xffE2B317);');
    buffer.writeln('  static const Color gradient1 = Color(0xff5EBE4E);');
    buffer.writeln('  static const Color gradient2 = Color(0xff239DD1);');
    buffer.writeln('  static Color tabsBackground = Color(0xff239DD1);');
    buffer.writeln('  static Color navbarBackground = Color(0xff383838);');
    buffer.writeln('  static Color navbarSelected = Color(0xff383838);');
    buffer.writeln('  static Color navbarUnselected = Color(0xff383838).withOpacity(0.4);');
    buffer.writeln('  static Color selectedCarText = Colors.white;');
    buffer.writeln('  static Color unselectedCarText = Color(0xff606260);');
    buffer.writeln('  static Color gloveBoxPDFColor = Color(0xffFF4B55);');
    buffer.writeln('  static Color gloveBoxPictureColor = Color(0xff2354D1);');
    buffer.writeln();
  }

  void _appendThemeData(StringBuffer buffer) {
    buffer.writeln('  ThemeData get themeData {');

    this.config.flavors.forEach((name, flavor) {
      buffer.writeln('    ColorScheme colorScheme${name.toCamelCase()} = ColorScheme(');
      buffer.writeln('      primary: ${flavor.app.primary},');
      buffer.writeln('      primaryVariant: Color(0xff239DD1),');
      buffer.writeln('      surface: Color(0xff5EBE4E),');
      buffer.writeln('      background: Color(0xffF1F3F4),');
      buffer.writeln('      secondary: ${flavor.app.secondary},');
      buffer.writeln('      secondaryVariant: Color(0xff606260),');
      buffer.writeln('      error: Color(0xffE2173A),');
      buffer.writeln('      onPrimary: Color(0xffBABABA),');
      buffer.writeln('      onSecondary: Color(0xff239DD1),');
      buffer.writeln('      onSurface: Color(0xffF1F3F4),');
      buffer.writeln('      onBackground: Color(0xff606260),');
      buffer.writeln('      onError: Color(0xffE2173A),');
      buffer.writeln('      brightness: Brightness.light,');
      buffer.writeln('    );');
      buffer.writeln();
    });

    buffer.writeln('');
  }

  @override
  String toString() => 'FlutterFlavorThemeProcessor';
}
