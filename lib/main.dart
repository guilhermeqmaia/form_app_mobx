import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:target_test/app_module.dart';
import 'package:target_test/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(
    () {
      runApp(ModularApp(module: AppModule(), child: const AppWidget()));
    },
    (_, __) {},
  );
}
