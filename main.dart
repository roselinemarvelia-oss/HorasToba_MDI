import 'package:flutter/material.dart';
import 'pages/main_page.dart';

void main() {
  runApp(const HorasSamosir());
}

class HorasSamosir extends StatelessWidget {
  const HorasSamosir({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HorasSamosir',
      home: const MainPage(),
    );
  }
}
