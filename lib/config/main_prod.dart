import 'package:flutter/material.dart';
import 'package:qooking_app/config/app_config.dart';
import 'package:qooking_app/main.dart';

// In IntelliJ/Android Studio click on Run -> Edit Configurations, select Flutter, and then select the
// lib/config/main_prod.dart file for the Dart entrypoint
void main() {
  var configuredApp = new AppConfig(
    env: 'production',
    apiBaseUrl: 'https://api.qoqa.com/api/graphql',
    child: new QookingApp(),
  );

  runApp(configuredApp);
}
