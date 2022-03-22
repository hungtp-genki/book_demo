import 'package:book_demo/models/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../../constants.dart';

class BookDetail extends StatelessWidget {
  final Book? book;
  const BookDetail({
    Key? key,
    this.book,
  }) : super(key: key);

  List<Widget> subtitle() {
    if (book!.subtitle != "") {
      return [
        Text(
          book!.subtitle,
          style: GoogleFonts.playfairDisplay(
            fontSize: 16,
            color: colorRusianViolet,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ];
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          book!.title,
          style: const TextStyle(
            color: colorRusianViolet,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            LineIcons.arrowLeft,
            color: colorRusianViolet,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              LineIcons.horizontalEllipsis,
              color: colorRusianViolet,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book!.title,
                style: GoogleFonts.oleoScript(
                  fontSize: 32,
                ),
              ),
              ...subtitle(),
              Text(
                book!.author,
                style: GoogleFonts.robotoSlab(
                  fontSize: 12,
                  color: colorRusianViolet,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  const Spacer(),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      bottomLeft: Radius.circular(32),
                    ),
                    child: SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Hero(
                        tag: book!.id,
                        child: Image.asset(
                          book!.imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Text(
                    book!.rate.toString(),
                    style: const TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  RatingStars(
                    value: book!.rate,
                    valueLabelVisibility: false,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(book!.content),
            ],
          ),
        ),
      ),
    );
  }
}
