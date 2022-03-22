import 'package:book_demo/infra/hive_service.dart';
import 'package:book_demo/models/book.dart';
import 'package:get/get.dart';

class BookListControler extends GetxController {
  Rx<List<Book>> $books = Rx([]);
  late HiveService _hiveService;

  BookListControler() {
    _hiveService = HiveService();
    loadBooks();
  }

  loadBooks() async {
    final _books = await _hiveService.allBooks();
    $books.value = _books;
  }
}
