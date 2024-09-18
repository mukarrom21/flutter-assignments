import 'package:flutter/material.dart';
import 'package:flutter_assignments/screens/product_list_screen.dart';

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xffe3c9bf),
        )
      ),
      home: const ProductListScreen(),
    );
  }
}
