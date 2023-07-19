import 'package:coding_test/training_series/core/services/service_locator.dart';
import 'package:coding_test/training_series/presentation/screens/series_screen.dart';
import 'package:flutter/material.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      home: SeriesScreen(),
    );
  }
}
