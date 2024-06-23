import 'package:get/get.dart';
import 'package:perpustakaan_app/models/book_model.dart';
import 'package:perpustakaan_app/models/category.dart';
import 'package:perpustakaan_app/services/books_service.dart';

class BookController extends GetxController {
  var baseUrl = 'https://jsonplaceholder.typicode.com'.obs;
  var book = <Book>[].obs;
  var categories = <Category>[].obs;
  final BookService books = BookService();

  Future<void> getBook() async {
    try {
      var data = await books.getdatabook(
        baseUrl.value,
      );
      book.value = data!;
    } catch (e) {
      throw Exception('Failed to get data');
    }
  }

  Future<void> getDataCategories() async {
    try {
      var data = await books.getdataCategory(baseUrl.value);
      categories.value = data!;
    } catch (e) {
      throw Exception('Failed to get data');
    }
  }

  Future<void> getBookByCategory(String id) async {
    try {
      var data = await books.getBookbyCategory(id, baseUrl.value);
      book.value = data!;
    } catch (e) {
      throw Exception('Failed to get data');
    }
  }

  Future<void> editBook(
      {required String id,
      required String title,
      required String author,
      required int year,
      required String category_id}) async {
    try {
      await books.editdatabook(
          url: baseUrl.value,
          id: id,
          title: title,
          author: author,
          year: year,
          category_id: category_id);
      getBook();
      Get.back();
    } catch (e) {
      throw Exception('Failed to update data');
    }
  }

  Future<void> deleteBook(String id) async {
    try {
      await books.deletedatabook(
        id: id,
        url: baseUrl.value,
      );
      getBook();
    } catch (e) {
      throw Exception('Failed to update data');
    }
  }

  Future<void> createBook(
      {required String title,
      required String author,
      required int year,
      required String category_id}) async {
    try {
      await books.createdatabook(
          url: baseUrl.value,
          title: title,
          author: author,
          year: year,
          category_id: category_id);
      getBook();
      getDataCategories();
      Get.back();
    } catch (e) {
      throw Exception('Failed to create data');
    }
  }

  Future<void> createDataCategories({
    required String name,
  }) async {
    try {
      await books.createdatacategories(name: name, url: baseUrl.value);
      getBook();
      getDataCategories();
      Get.back();
    } catch (e) {
      throw Exception('Failed to create data');
    }
  }

  Future<List<String>> getCategoryListName() async {
    try {
      var category = await books.getcategoryListName(url: baseUrl.value);
      return category;
    } catch (e) {
      throw Exception('Failed to create data');
    }
  }

  void updateBaseUrl(String newUrl) {
    baseUrl.value = "http://$newUrl:8000/api/";
    getBook();
    getDataCategories();
  }
}
