import 'package:tp1/models/book.dart';
import 'package:tp1/services/db_helper.dart';

class BookService {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  Future<void> addToBasket(Book book) async {
    final db = await _dbHelper.database;

    await db.insert('book', {
      'name': book.name,
      'price': book.price,
      'image': book.image,
    });
  }

  Future<List<Book>> fetchBasketBooks() async {
    final db = await _dbHelper.database;

    final List<Map<String, Object?>> result = await db.query('book');

    return result.map((row) {
      return Book(
        row["name"].toString(),
        row["price"] as int,
        row["image"].toString(),
      );
    }).toList();
  }
}
