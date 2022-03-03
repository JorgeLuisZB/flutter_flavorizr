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

class FlutterFlavorsProcessor extends StringProcessor {
  FlutterFlavorsProcessor({
    String? input,
    required Flavorizr config,
  }) : super(
          input: input,
          config: config,
        );

  @override
  String execute() {
    StringBuffer buffer = StringBuffer();

    _appendFlavorEnum(buffer);
    _appendFlavorValues(buffer);
    _appendFlavorClass(buffer);

    return buffer.toString();
  }

  void _appendFlavorEnum(StringBuffer buffer) {
    buffer.writeln('import \'package:flutter/material.dart\';');
    buffer.writeln('import \'package:connect/app/utils/string_utils.dart\';');
    buffer.writeln();
    buffer.writeln('enum Flavor {');

    config.flavors.keys.forEach((String flavorName) {
      buffer.writeln('  ${flavorName.camelCase},');
    });

    buffer.writeln('}');
    buffer.writeln();
  }

  void _appendFlavorValues(StringBuffer buffer) {
    buffer.writeln('class FlavorValues {');
    buffer.writeln('  FlavorValues({@required this.baseUrl});');
    buffer.writeln();
    buffer.writeln('  final String baseUrl;');
    buffer.writeln('}');
    buffer.writeln();
  }

  void _appendFlavorClass(StringBuffer buffer) {
    buffer.writeln('class FlavorConfig {');
    buffer.writeln('  final Flavor flavor;');
    buffer.writeln('  final FlavorValues values;');
    buffer.writeln('  final String name;');
    buffer.writeln('  final Color color;');
    buffer.writeln('  final bool hasDealer;');
    buffer.writeln();
    buffer.writeln('  static FlavorConfig _instance;');
    buffer.writeln();
    buffer.writeln('  factory FlavorConfig({');
    buffer.writeln('    @required Flavor flavor,');
    buffer.writeln('    Color color: Colors.blue,');
    buffer.writeln('    @required FlavorValues values,');
    buffer.writeln('    @required bool hasDealer,');
    buffer.writeln('   }) {');
    buffer.writeln('    _instance ??= FlavorConfig._internal(');
    buffer.writeln('      flavor,');
    buffer.writeln('      StringUtils.enumName(flavor.toString()),');
    buffer.writeln('      color,');
    buffer.writeln('      values,');
    buffer.writeln('      hasDealer,');
    buffer.writeln('   );');
    buffer.writeln('   return _instance;');
    buffer.writeln('  }');
    buffer.writeln();

    buffer.writeln('  FlavorConfig._internal(');
    buffer.writeln('    this.flavor,');
    buffer.writeln('    this.name,');
    buffer.writeln('    this.color,');
    buffer.writeln('    this.values,');
    buffer.writeln('    this.hasDealer,');
    buffer.writeln('  );');
    buffer.writeln();

    buffer.writeln('  static FlavorConfig get instance => _instance;');
    buffer.writeln();

    config.flavors.keys.forEach((String flavorName) {
      buffer.writeln('  static bool is${flavorName.pascalCase}() => _instance.flavor == Flavor.${flavorName.camelCase};');
      buffer.writeln();
    });
    buffer.writeln('}');
    buffer.writeln();
  }

  @override
  String toString() => 'FlutterFlavorsProcessor';
}
