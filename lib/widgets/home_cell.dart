import 'package:flutter/material.dart';
import '../models/book.dart';

class HomeCell extends StatelessWidget {
  final Book book;

  const HomeCell(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            // Image du livre (à gauche)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                book.image,
                width: 80,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),

            // Nom + Prix (à droite)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    book.name,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${book.price} TND",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
