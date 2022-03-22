import 'package:book_demo/constants.dart';
import 'package:book_demo/controllers/book_list_controller.dart';
import 'package:book_demo/data/books.dart';
import 'package:book_demo/infra/hive_service.dart';
import 'package:book_demo/models/book.dart';
import 'package:book_demo/screens/book_list/book_list.dart';
import 'package:book_demo/utils/book_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await prepareApp();
  runApp(const BookApp());
}

Future<void> prepareApp() async {
  // Data
  logger.i("===== START INITIAL BOOK DATA =====");
  await Hive.initFlutter();
  Hive.registerAdapter(BookAdapter());
  HiveService.bookBox = await Hive.openBox(bookBoxName);
  final _books = createBooks(books);
  final _hiveService = HiveService();
  if (await _hiveService.countBooks() == 0) {
    await _hiveService.addBooks(_books);
  }
  logger.i("===== INITIAL BOOK DATA DONE =====");

  // Controllers
  logger.i("===== INITIAL BookListController =====");
  Get.lazyPut<BookListControler>(() => BookListControler());
  logger.i("===== INITIAL BookListController DONE =====");
}

class BookApp extends StatelessWidget {
  const BookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BookList(),
    );
  }
}
