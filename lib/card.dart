import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:perpustakaan_app/controllers/book_controller.dart';
import 'package:perpustakaan_app/edit_page.dart';
import 'package:perpustakaan_app/models/book_model.dart';

class ContainerApps extends StatelessWidget {
  final Book book;

  const ContainerApps({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    final BookController bookController = Get.find(tag: "books");
    return Card(
        color: Colors.blueAccent,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(15),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),

              //title
              title: Text(
                book.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15),
                // style: textpoppins.copyWith(
                //     fontWeight: FontWeight.bold,
                //     color: putih,
                //     fontSize: mq.width * 0.035),
              ),

              //subtitle
              subtitle: Row(
                children: [
                  Text(
                    book.author,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 10),
                  )
                ],
              ),

              //trailing
              trailing: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        book.year.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      SizedBox(width: 4),
                      Text(book.category.name!,
                          style: TextStyle(color: Colors.white, fontSize: 12))
                    ],
                  ),
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () => Get.to(() => DataInput(
                                  book: book,
                                )),
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: mq.width * 0.07,
                            )),
                        SizedBox(width: 4),
                        IconButton(
                            onPressed: () {
                              bookController.deleteBook(book.id.toString());
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: mq.width * 0.07,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
