import 'package:book_demo/utils/id_utils.dart';

import '../models/book.dart';

List<Book> createBooks(List<Map<String, dynamic>> jsonData) {
  return jsonData.map<Book>((data) {
    final _bookId = genNewBooId();
    Book _book = Book(_bookId);
    return _book.fromJson(data);
  }).toList();
}
