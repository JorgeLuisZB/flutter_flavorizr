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

class FlutterAssetsProcessor extends StringProcessor {
  FlutterAssetsProcessor({
    String? input,
    required Flavorizr config,
  }) : super(
    input: input,
    config: config,
  );

  @override
  String execute() {
    StringBuffer buffer = StringBuffer();

    _appendFlavorAssets(buffer);

    return buffer.toString();
  }

  void _appendFlavorAssets(StringBuffer buffer) {
    buffer.writeln('class ImgRes {');
    buffer.writeln('  static const String bg = \'assets/backgrounds/bg.png\';');
    buffer.writeln('  static const String redPin = \'assets/icons/red_pin.png\';');
    buffer.writeln('  static const String greenPin = \'assets/icons/green_pin.png\';');
    buffer.writeln('}');
    buffer.writeln();
    buffer.writeln('class SvgResFlavor {');
    buffer.writeln();
    this.config.flavors.forEach((name, flavor) {
      buffer.writeln('  // ${flavor.app.name}');
      buffer.writeln('  static const String ${name.camelCase}Logo = \'assets/logos/${name}_logo.svg\';');
      buffer.writeln('  static const String ${name.camelCase}Pin = \'assets/icons/${name}_pin.png\';');
      buffer.writeln('  static const String ${name.camelCase}HLogo = \'assets/logos/${name}_logo_h.svg\';');
      buffer.writeln();
    });
    buffer.writeln('}');
  }


  @override
  String toString() => 'FlutterAssetsProcessor';
}
