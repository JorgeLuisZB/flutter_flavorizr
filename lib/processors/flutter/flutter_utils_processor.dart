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

import '../../parser/models/flavors/flavor.dart';

class FlutterFlavorUtilsProcessor extends StringProcessor {
  FlutterFlavorUtilsProcessor({
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
    _appendFlavorIcons(buffer);
    _appendFlavorString(buffer);
    _appendFlavorPin(buffer);
    _appendFlavorHead(buffer);
    _appendAndroidIOSBundleId(buffer);

    return buffer.toString();
  }

  void _appendImports(StringBuffer buffer) {
    buffer.writeln('import \'dart:typed_data\';');
    buffer.writeln();
    buffer.writeln('import \'package:connect/app/utils/flavor_constants.dart\';');
    buffer.writeln('import \'package:connect/app/utils/flavor_config.dart\';');
    buffer.writeln('import \'package:connect/app/utils/flavor_assets.dart\';');
    buffer.writeln('import \'package:connect/app/utils/image_utils.dart\';');
    buffer.writeln('import \'package:flutter/material.dart\';');
    buffer.writeln('import \'package:flutter_svg/svg.dart\';');
    buffer.writeln();
  }

  void _appendFlavorIcons(StringBuffer buffer) {
    buffer.writeln('class FlavorUtils {');
    buffer.writeln('  static SvgPicture getFlavorIcon() {');

    for(int i = 0; i < config.flavors.keys.length; i++) {
      String flavorName = config.flavors.keys.elementAt(i);

      buffer.writeln(i == 0 ? '    if (FlavorConfig.instance.flavor == Flavor.${flavorName.camelCase}) {': 'if (FlavorConfig.instance.flavor == Flavor.${flavorName.camelCase}) {');
      buffer.writeln('      return SvgPicture.asset(');
      buffer.writeln('        SvgResFlavor.${flavorName.camelCase}Logo,');
      buffer.writeln('        semanticsLabel: \'${flavorName.titleCase} Logo\',');
      buffer.writeln('        width: 178.0,');
      buffer.writeln('        height: 126.0,');
      buffer.writeln('      );');
      buffer.write('    } else ');
    }

    buffer.writeln('{');
    buffer.writeln('      return SvgPicture.asset(');
    buffer.writeln('        SvgResFlavor.ikonLogo,');
    buffer.writeln('        semanticsLabel: \'ikon Technologies Logo\',');
    buffer.writeln('        width: 178.0,');
    buffer.writeln('        height: 126.0,');
    buffer.writeln('       );');
    buffer.writeln('    }');
    buffer.writeln('  }');
    buffer.writeln();
  }

  void _appendFlavorString(StringBuffer buffer) {
    int index = 0;
    buffer.writeln('  static String getFlavorString() {');

    config.flavors.forEach((name, flavor) {
      buffer.writeln(index == 0 ? '    if (FlavorConfig.instance.flavor == Flavor.${name.camelCase}) {' : 'if (FlavorConfig.instance.flavor == Flavor.${name.camelCase}) {');
      buffer.writeln('      return \'${flavor.app.name.titleCase}\';');
      buffer.write('    } else ');

      index++;
    });

    buffer.writeln(' {');
    buffer.writeln('      return \'Ikon\';');
    buffer.writeln('    }');
    buffer.writeln('  }');
    buffer.writeln();
  }

  void _appendFlavorPin(StringBuffer buffer) {
    buffer.writeln('  static Future<Uint8List> getFlavorPin() async {');

    for(int i = 0; i < config.flavors.keys.length; i++) {
      String flavorName = config.flavors.keys.elementAt(i);

      buffer.writeln(i == 0 ? '    if (FlavorConfig.instance.flavor == Flavor.${flavorName.camelCase}) {' : 'if (FlavorConfig.instance.flavor == Flavor.${flavorName.camelCase}) {');
      buffer.writeln('      return await getBytesFromAsset(SvgResFlavor.${flavorName.camelCase}Pin, 150);');
      buffer.write('    } else ');
    }

    buffer.writeln('{');
    buffer.writeln('      return await getBytesFromAsset(SvgResFlavor.ikonPin, 150);');
    buffer.writeln('    }');
    buffer.writeln('  }');
    buffer.writeln();
  }

  void _appendFlavorHead(StringBuffer buffer) {
    buffer.writeln('  static SvgPicture getFlavorHead() {');

    for(int i = 0; i < config.flavors.keys.length; i++) {
      String flavorName = config.flavors.keys.elementAt(i);

      buffer.writeln(i == 0 ? '    if (FlavorConfig.instance.flavor == Flavor.${flavorName.camelCase}) {' : 'if (FlavorConfig.instance.flavor == Flavor.${flavorName.camelCase}) {');
      buffer.writeln('      return SvgPicture.asset(');
      buffer.writeln('        SvgResFlavor.${flavorName.camelCase}HLogo,');
      buffer.writeln('        height: 25,');
      buffer.writeln('        width: 236,');
      buffer.writeln('        fit: BoxFit.contain,');
      buffer.writeln('      );');
      buffer.write('    } else ');
    }

    buffer.writeln(' {');
    buffer.writeln('      return SvgPicture.asset(');
    buffer.writeln('        SvgResFlavor.ikonHLogo,');
    buffer.writeln('        height: 25,');
    buffer.writeln('        width: 236,');
    buffer.writeln('        fit: BoxFit.contain,');
    buffer.writeln('      );');
    buffer.writeln('    }');
    buffer.writeln('  }');
    buffer.writeln();
  }

  void _appendAndroidIOSBundleId(StringBuffer buffer) {
    buffer.writeln('  static List<String> getAndroidAndIOSBundleId() {');
    buffer.writeln('    switch (FlavorConfig.instance.flavor) {');

    config.flavors.keys.forEach((flavorName) {
      buffer.writeln('      case Flavor.${flavorName.camelCase}:');
      buffer.writeln('        return [${flavorName.camelCase}AndroidApplicationId, ${flavorName.camelCase}IOSBundle];');
    });

    buffer.writeln('      default:');
    buffer.writeln('        return [ikonAndroidApplicationId, ikonIOSBundle];');
    buffer.writeln('    }');
    buffer.writeln('  }');
    buffer.writeln('}');
  }

  @override
  String toString() => 'FlutterFlavorUtilsProcessor';
}
