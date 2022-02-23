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

class FlutterAppIdProcessor extends StringProcessor {
  FlutterAppIdProcessor({
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
    _appendFlavorAppId(buffer);

    return buffer.toString();
  }

  void _appendImports(StringBuffer buffer) {
    buffer.writeln('import \'package:connect/app/utils/flavor_constants.dart\';');
    buffer.writeln('import \'package:connect/app/utils/flavor_config.dart\';');
    buffer.writeln();
  }

  void _appendFlavorAppId(StringBuffer buffer) {
    buffer.writeln('class FlavorAppId {');
    buffer.writeln('  String androidApplicationId;');
    buffer.writeln('  String iOSAppId;');
    buffer.writeln();
    buffer.writeln('  FlavorAppId({this.androidApplicationId, this.iOSAppId});');
    buffer.writeln();
    buffer.writeln('  checkFlavor({Flavor flavor}) {');
    buffer.writeln('    switch (flavor) {');

    this.config.flavors.forEach((name, flavor) {
      buffer.writeln('      case Flavor.${name}:');
      buffer.writeln('        this.androidApplicationId = ${name.camelCase}AndroidApplicationId;');
      buffer.writeln('        this.iOSAppId = ${name.camelCase}IOSAppId;');
      buffer.writeln('        break;');
    });

    buffer.writeln('    }');
    buffer.writeln('  }');
    buffer.writeln('}');
  }


  @override
  String toString() => 'FlutterAppIdProcessor';
}
