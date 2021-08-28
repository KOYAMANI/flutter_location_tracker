import 'package:flutter/material.dart';
import 'package:location_tracker/app.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Permission.locationWhenInUse.serviceStatus.isEnabled;
  runApp(const App());
}
