import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/book.dart';

class BookService {
  final CollectionReference _booksCollection = FirebaseFirestore.instance
      .collection('books');

  Stream<List<Book>> streamBooks(String userEmail) {
    return _booksCollection
        .where('userEmail', isEqualTo: userEmail)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Book(
              data['name'] ?? '',
              data['price']?.toDouble() ?? 0.0,
              data['image'] ?? '',
            );
          }).toList(),
        );
  }

  Future<void> addBook(Book book, String? userEmail) async {
    await _booksCollection.add({
      'name': book.name,
      'price': book.price,
      'image': book.image,
      'userEmail': userEmail,
    });
  }

  Future<void> deleteBook(String docId) async {
    await _booksCollection.doc(docId).delete();
  }
}
