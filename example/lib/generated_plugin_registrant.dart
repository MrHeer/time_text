//
// Generated file. Do not edit.
//

// ignore: unused_import
import 'dart:ui';

import 'package:import_js_library/import_js_library.dart';
import 'package:wakelock_web/wakelock_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(PluginRegistry registry) {
  ImportJsLibrary.registerWith(registry.registrarFor(ImportJsLibrary));
  WakelockWeb.registerWith(registry.registrarFor(WakelockWeb));
  registry.registerMessageHandler();
}
