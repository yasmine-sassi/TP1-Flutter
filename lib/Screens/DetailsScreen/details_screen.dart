import 'package:flutter/material.dart';
import '../../models/book.dart';

class DetailsScreen extends StatefulWidget {
  final Book book;

  const DetailsScreen({super.key, required this.book});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int quantity = 10; // quantité initiale

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF216BEB),
        title: Text(
          widget.book.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(6),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(widget.book.image, height: 500),
          ),

          const Text(
            "Lorem ipsum dolor sit amet consectetur adipiscing elit. "
            "Sed non risus. Suspendisse lectus tortor, dignissim sit amet, "
            "adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. "
            "Maecenas ligula massa, varius a, semper congue.",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${widget.book.price} TND",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Center(
            child: Text(
              "Quantity: $quantity",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 16),

          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                if (quantity > 0) {
                  setState(() {
                    quantity--;
                  });
                }
              },
              icon: const Icon(Icons.shopping_bag),
              label: const Text(
                "Purchase",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
