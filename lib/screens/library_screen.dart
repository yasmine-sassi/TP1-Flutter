import 'package:flutter/material.dart';
import '../models/book.dart';
import '../widgets/library_cell.dart';
import 'details_screen.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final books = [
      Book("Book 1", 100, 'assets/images/image1.png'),
      Book("Book 2", 50, 'assets/images/image2.png'),
      Book("Book 3", 50, 'assets/images/image3.png'),
      Book("Book 4", 50, 'assets/images/image4.png'),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 106, 49),
        title: const Text(
          "Library",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 4,
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(book: books[index]),
                ),
              );
            },
            child: LibraryCell(books[index]),
          );
        },
      ),
    );
  }
}
