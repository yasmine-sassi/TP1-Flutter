import 'package:flutter/material.dart';
import '../../models/book.dart';
import '../../widgets/home_cell.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var books = [
      HomeCell(Book("L'ombre du vent", 40, 'assets/images/image1.png')),
      HomeCell(Book("La Prof  McFADDEN", 50, 'assets/images/image2.png')),
      HomeCell(Book("Le prisonnier du ciel", 40, 'assets/images/image3.png')),
      HomeCell(Book("La femme de ménage", 50, 'assets/images/image4.png')),
    ];

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
        child: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) => books[index],
        ),
      ),
    );
  }
}
