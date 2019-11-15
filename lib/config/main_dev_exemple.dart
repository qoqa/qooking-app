import 'package:flutter/material.dart';
import 'package:qooking_app/config/app_config.dart';
import 'package:qooking_app/main.dart';

// Create a copy of this file named "main_dev.dart" to launch the app with specific dev configuration
// In IntelliJ/Android Studio click on Run -> Edit Configurations, select Flutter, and then select the
// lib/config/main_dev.dart file for the Dart entrypoint
void main() {
  var configuredApp = new AppConfig(
    env: 'development',
    apiBaseUrl: 'https://api.example.com/',
    child: new QookingApp(),
  );

  runApp(configuredApp);
}
