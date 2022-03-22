import 'package:book_demo/models/book.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static late Box<Book> bookBox;

  Future<List<Book>> allBooks() async {
    return HiveService.bookBox.values.toList();
  }

  Future<void> addBooks(List<Book> books) async {
    await HiveService.bookBox.putAll(
      books.asMap().map<String, Book>(
            (key, value) => MapEntry<String, Book>(value.id, value),
          ),
    );
  }

  Future<int> countBooks() async {
    return HiveService.bookBox.values.length;
  }
}
