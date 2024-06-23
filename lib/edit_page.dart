import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perpustakaan_app/container_input.dart';
import 'package:perpustakaan_app/container_spalsh.dart';
import 'package:perpustakaan_app/controllers/book_controller.dart';
import 'package:perpustakaan_app/models/book_model.dart';

class DataInput extends StatefulWidget {
  final Book book;
  DataInput({
    super.key,
    required this.book,
  });

  @override
  State<DataInput> createState() => _DataInputState();
}

class _DataInputState extends State<DataInput> {
  TextEditingController title = TextEditingController();
  TextEditingController author = TextEditingController();
  TextEditingController year = TextEditingController();
  final BookController bookController = Get.find(tag: "books");

  String? filename;
  String? category;
  @override
  void initState() {
    title.text = widget.book.title;
    author.text = widget.book.author;
    year.text = widget.book.year.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text("Edit Data Buku"),
      ),
      body: LayoutBuilder(
        builder: (context, p1) => Padding(
          padding: EdgeInsets.only(
              left: p1.maxWidth * 0.03,
              right: p1.maxWidth * 0.03,
              top: p1.maxHeight * 0.03),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContainerInput(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.15,
                    nama: "Judul Buku",
                    hint: "Masukkan Judul Buku",
                    control: title),
                ContainerInput(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.15,
                    nama: "Nama Pengarang",
                    hint: "Masukkan Nama Author",
                    control: author),
                ContainerInput(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.15,
                    nama: "Tahun Terbit Buku",
                    hint: "Masukkan Tahun",
                    control: year),
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: p1.maxWidth,
                  height: p1.maxHeight * 0.1,
                  child: DropdownSearch<String>(
                    onChanged: (value) {
                      setState(() {
                        category = value;
                      });
                    },
                    dropdownDecoratorProps: DropDownDecoratorProps(),
                    asyncItems: (_) => bookController.getCategoryListName(),
                    popupProps: const PopupProps.menu(
                      showSelectedItems: true,
                      showSearchBox: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: p1.maxHeight * 0.04,
                ),
                ContainerSplash(
                    width: p1.maxWidth,
                    height: p1.maxHeight * 0.1,
                    fungsi: () {
                      bookController.editBook(
                          id: widget.book.id.toString(),
                          title: title.text,
                          author: author.text,
                          year: int.parse(year.text),
                          category_id: category!);
                    },
                    nama: "Edit Buku")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
