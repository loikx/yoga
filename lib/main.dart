import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:yoga/login_signup/login_page.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MaterialApp(
    title: 'Yoga',
    home: LogInPage(),
    debugShowCheckedModeBanner: false,
  ));
}


// TODO: написать документацию к проекту
// TODO: написать тесты для виджетов