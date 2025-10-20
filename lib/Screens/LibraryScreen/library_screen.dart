import 'package:flutter/material.dart';
import '../../models/book.dart';
import '../../widgets/library_cell.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final books = [
      Book("L'ombre du vent", 40, 'assets/images/image1.png'),
      Book("La Prof McFADDEN", 50, 'assets/images/image1.png'),
      Book("Le prisonnier du ciel", 40, 'assets/images/image1.png'),
      Book("La femme de ménage", 50, 'assets/images/image1.png'),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF216BEB),
        title: const Text(
          "Library",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Expanded(
        child: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 colonnes
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.65, // ajuste hauteur/largeur de chaque carte
          ),
          itemCount: books.length,
          itemBuilder: (context, index) {
            return LibraryCell(books[index]);
          },
        ),
      ),
    );
  }
}
