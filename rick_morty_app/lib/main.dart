import 'package:flutter/material.dart';
import 'pages/character_list_page.dart';

void main() {
  runApp(const RickyApp());
}

class RickyApp extends StatelessWidget {
  const RickyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty API',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CharacterListPage(),
    );
  }
}
