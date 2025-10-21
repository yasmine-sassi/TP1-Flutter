import 'package:flutter/material.dart';
import '../../models/book.dart';

class DetailsScreen extends StatefulWidget {
  final Book book;

  const DetailsScreen({super.key, required this.book});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int quantity = 10;
  bool isFavorite = false;

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
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isFavorite ? "Ajouté aux favoris" : "Retiré des favoris",
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Image du livre
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(widget.book.image, height: 500),
          ),
          const SizedBox(height: 16),

          // Description
          const Text(
            "Lorem ipsum dolor sit amet consectetur adipiscing elit. "
            "Sed non risus. Suspendisse lectus tortor, dignissim sit amet, "
            "adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam.",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Prix
          Center(
            child: Text(
              "${widget.book.price} TND",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),

          // 🏷️ Chip de quantité
          Center(
            child: Chip(
              label: Text(
                quantity > 0 ? "En stock : $quantity" : "Rupture de stock",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: quantity > 0
                  ? Colors.green[200]
                  : Colors.red[200],
            ),
          ),
          const SizedBox(height: 16),

          // 🛒 Bouton achat
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                if (quantity > 0) {
                  setState(() {
                    quantity--;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Livre acheté avec succès ! ✅"),
                      duration: Duration(seconds: 1),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Stock épuisé ❌"),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
              icon: const Icon(Icons.shopping_bag),
              label: const Text(
                "Acheter",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
