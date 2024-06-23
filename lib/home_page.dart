import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perpustakaan_app/add_categories.dart';
import 'package:perpustakaan_app/add_url.dart';
import 'package:perpustakaan_app/card.dart';
import 'package:perpustakaan_app/controllers/book_controller.dart';
import 'package:perpustakaan_app/tambah_buku.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BookController bookController = Get.put(BookController(), tag: "books");
  @override
  void initState() {
    bookController.getBook();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(
          ("Semua Buku"),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.restore,
            color: Colors.black,
          ),
          onPressed: () {
            bookController.getBook();
          },
        ),
        actions: [
          IconButton(
              onPressed: () => Get.to(() => const AddCategories()),
              icon: Icon(
                Icons.add_box,
                color: Colors.black,
              )),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: () => Get.to(() => const DataInput()),
            ),
          ),
          IconButton(
              onPressed: () => Get.to(() => const AddUrl()),
              icon: Icon(
                Icons.add_card,
                color: Colors.black,
              )),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: mq.height * .016, left: mq.width * .04, right: mq.width * .04),
        child: Obx(
          () => ListView.builder(
            itemCount: bookController.book.length,
            itemBuilder: (context, index) {
              return ContainerApps(
                book: bookController.book[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
