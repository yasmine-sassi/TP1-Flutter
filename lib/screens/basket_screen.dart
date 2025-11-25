import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services/book_service.dart';
import '../widgets/home_cell.dart';

class BasketScreen extends StatefulWidget {
  final String? userEmail;

  const BasketScreen({super.key, this.userEmail});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  final BookService _bookService = BookService();
  List<Book> _books = [];

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  Future<void> _loadBooks() async {
    List<Book> books;
    if (widget.userEmail != null) {
      // récupère les livres de l'utilisateur spécifique
      books = await _bookService.fetchBooksByUser(widget.userEmail!);
    } else {
      // récupère tous les livres
      books = await _bookService.fetchAllBooks();
    }

    if (!mounted) return;
    setState(() {
      _books = books;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 106, 49),
        title: const Text(
          "Basket",
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _books.isEmpty
          ? const Center(child: Text("No books found"))
          : ListView.builder(
              itemCount: _books.length,
              itemBuilder: (_, index) {
                final book = _books[index];
                return HomeCell(book: book);
              },
            ),
    );
  }
}
