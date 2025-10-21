import 'package:flutter/material.dart';
import '../../models/book.dart';
import '../../widgets/home_cell.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Multiple books
    final book1 = Book("L'ombre du vent", 40, 'assets/images/image1.png');
    final book2 = Book(
      "Le livre des Baltimore",
      30,
      'assets/images/image2.png',
    );
    final book3 = Book("Les Misérables", 50, 'assets/images/image3.png');
    final book4 = Book("la prof mcFADDEN", 35, 'assets/images/image4.png');

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
        child: Column(
          children: [
            HomeCell(book1),
            HomeCell(book2),
            HomeCell(book3),
            HomeCell(book4),
          ],
        ),
      ),
    );
  }
}
