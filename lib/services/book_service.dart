import 'package:tp1/models/book.dart';
import 'package:tp1/services/db_helper.dart';

class BookService {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  // Ajouter un livre
  Future<void> addBook(Book book) async {
    final db = await _dbHelper.database;
    await db.insert('book', book.toMap());
  }

  // Lire tous les livres
  Future<List<Book>> fetchAllBooks() async {
    final db = await _dbHelper.database;
    final result = await db.query('book');
    return result.map((row) => Book.fromMap(row)).toList();
  }

  // Lire les livres d'un utilisateur spécifique
  Future<List<Book>> fetchBooksByUser(String userEmail) async {
    final db = await _dbHelper.database;
    final result = await db.query(
      'book',
      where: 'userEmail = ?',
      whereArgs: [userEmail],
    );
    return result.map((row) => Book.fromMap(row)).toList();
  }

  // Mettre à jour un livre
  Future<void> updateBook(Book book) async {
    final db = await _dbHelper.database;
    await db.update(
      'book',
      book.toMap(),
      where: 'name = ?',
      whereArgs: [book.name],
    );
  }

  // Supprimer un livre
  Future<void> deleteBook(String name) async {
    final db = await _dbHelper.database;
    await db.delete('book', where: 'name = ?', whereArgs: [name]);
  }
}
