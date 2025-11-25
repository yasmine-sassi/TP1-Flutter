import 'package:flutter/material.dart';
import '../models/book.dart';
import '../services/book_service.dart';
import '../widgets/home_cell.dart';

class BasketScreen extends StatelessWidget {
  final String userEmail;
  final BookService _bookService = BookService();

  BasketScreen({super.key, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basket')),
      body: StreamBuilder<List<Book>>(
        stream: _bookService.streamBooks("test@test.com"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No books found'));
          }

          final books = snapshot.data!;
          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return Dismissible(
                key: ValueKey(book.name),
                background: Container(color: Colors.red),
                onDismissed: (_) {
                  // Ici tu devrais stocker le docId dans Book pour delete
                },
                child: HomeCell(book: book),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ajouter un livre exemple
          _bookService.addBook(
            Book('Book X', 25, 'assets/images/image1.png'),
            "test@test.com",
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
