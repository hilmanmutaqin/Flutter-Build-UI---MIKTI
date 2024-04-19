import 'package:flutter/material.dart';
import 'package:latihan_flutter/screen/home_screen.dart';

void main() {
  runApp(const LatihanFlutter());
}
class LatihanFlutter extends StatelessWidget {
  const LatihanFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Latihan App',
      home: HomeScreen() ,
    );
  }
}