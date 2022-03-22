import 'package:book_demo/constants.dart';
import 'package:book_demo/controllers/book_list_controller.dart';
import 'package:book_demo/screens/book_detail/book_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BookList extends StatelessWidget {
  const BookList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        screens: const [
          ListScreen(),
          ListScreen(),
          ListScreen(),
          ListScreen(),
          ListScreen(),
        ],
        items: [
          PersistentBottomNavBarItem(
            icon: const Icon(LineIcons.home),
            title: "Home",
            activeColorPrimary: colorRusianViolet,
            inactiveColorPrimary: colorLavenderGray,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(LineIcons.barChart),
            title: "Statistic",
            activeColorPrimary: colorRusianViolet,
            inactiveColorPrimary: colorLavenderGray,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(LineIcons.microphone),
            title: "Microphone",
            activeColorPrimary: colorRusianViolet,
            inactiveColorPrimary: colorLavenderGray,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(LineIcons.bookmark),
            title: "Microphone",
            activeColorPrimary: colorRusianViolet,
            inactiveColorPrimary: colorLavenderGray,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(LineIcons.user),
            title: "User",
            activeColorPrimary: colorRusianViolet,
            inactiveColorPrimary: colorLavenderGray,
          ),
        ],
        navBarStyle: NavBarStyle.style13,
      ),
    );
  }
}

class ListScreen extends GetView<BookListControler> {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bookController = Get.find<BookListControler>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Books",
          style: TextStyle(
            color: colorRusianViolet,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                LineIcons.bars,
                color: colorRusianViolet,
              ),
            );
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              LineIcons.search,
              color: colorRusianViolet,
            ),
          ),
        ],
      ),
      drawer: const Drawer(
        child: Center(
          child: Text("Drawer"),
        ),
      ),
      body: Obx(
        () => MasonryGridView.count(
          crossAxisCount: 2,
          itemCount: _bookController.$books.value.length,
          mainAxisSpacing: 16,
          crossAxisSpacing: 8,
          itemBuilder: (context, index) {
            final book = _bookController.$books.value[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BookDetail(
                      book: book,
                    ),
                  ),
                );
              },
              child: SizedBox(
                height: 250,
                child: Center(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    child: SizedBox(
                      child: Hero(
                        tag: book.id,
                        child: Image.asset(
                          book.imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
