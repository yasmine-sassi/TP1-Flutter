import 'package:flutter/material.dart';
import '../../models/book.dart';
import '../../widgets/home_cell.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Only one book
    final book = Book("L'ombre du vent", 40, 'assets/images/image1.png');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF216BEB),
        title: const Text(
          "Store INSAT",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: HomeCell(book), // Display the single book
        ),
      ),
    );
  }
}
