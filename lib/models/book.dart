// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'book.g.dart';

@HiveType(typeId: 0)
class Book extends Equatable {
  @HiveField(0)
  String id;

  @HiveField(1)
  late final String title;

  @HiveField(2)
  late final String author;

  @HiveField(3)
  late final String subtitle;

  @HiveField(4)
  late final String content;

  @HiveField(5)
  late final String imagePath;

  @HiveField(6)
  late final double rate;

  @HiveField(7)
  late final List<String> categories;

  Book(this.id);

  Book withTitle(String title) {
    title = title;
    return this;
  }

  Book withCategories(List<String> categories) {
    categories = categories;
    return this;
  }

  Book withAuthor(String author) {
    author = author;
    return this;
  }

  Book withSubtitle(String subtitle) {
    subtitle = subtitle;
    return this;
  }

  Book withRate(int rate) {
    rate = rate;
    return this;
  }

  Book withContent(String content) {
    content = content;
    return this;
  }

  Book withImaPath(String imagePath) {
    imagePath = imagePath;
    return this;
  }

  Book fromJson(Map<String, dynamic> json) {
    title = json["title"] as String;
    content = json["content"] as String;
    rate = json["rate"] as double;
    imagePath = json["image_path"] as String;
    author = json["author"] as String;
    subtitle = json["subtitle"] as String;
    categories = [];
    return this;
  }

  @override
  List<Object?> get props => [id];
}
