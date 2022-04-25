import 'package:flutter/material.dart';
import 'routes_names.dart';

import 'router.dart' as router;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // setupLocator();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    onGenerateRoute: router.generateRoute,
    initialRoute: FirstViewRoute,
  ));
}
