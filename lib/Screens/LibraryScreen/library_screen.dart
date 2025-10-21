import 'package:flutter/material.dart';
import '../../models/book.dart';
import '../../widgets/library_cell.dart';
import '../DetailsScreen/details_screen.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final List<Book> books = [
    Book("L'ombre du vent", 40, 'assets/images/image1.png'),
    Book("La Prof McFADDEN", 50, 'assets/images/image2.png'),
    Book("Le prisonnier du ciel", 40, 'assets/images/image3.png'),
    Book("La femme de ménage", 50, 'assets/images/image4.png'),
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // filtrer les livres selon la recherche
    final filteredBooks = books
        .where(
          (book) => book.name.toLowerCase().contains(searchQuery.toLowerCase()),
        )
        .toList();

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
      body: Column(
        children: [
          // 🔍 Barre de recherche
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Rechercher un livre...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          // 📚 Grille des livres
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 colonnes
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                final book = filteredBooks[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(book: book),
                      ),
                    );
                  },
                  child: LibraryCell(book),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
