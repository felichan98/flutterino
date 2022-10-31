import 'package:flutter/material.dart';
import 'src/routes/test_rest_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Carousel test', home: RestSenderDemo());
  }
}
