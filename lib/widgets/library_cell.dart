import 'package:flutter/material.dart';
import '../models/book.dart';

class LibraryCell extends StatelessWidget {
  final Book book;

  const LibraryCell(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image du livre avec coins arrondis
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                book.image,
                width: 120,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            // Nom du livre
            Text(
              book.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            //const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
