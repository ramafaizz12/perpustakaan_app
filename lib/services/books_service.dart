import 'package:http/http.dart' as http;
import 'package:perpustakaan_app/models/book_model.dart';
import 'package:perpustakaan_app/models/books.dart';
import 'dart:convert';
import 'package:perpustakaan_app/models/category.dart';

class BookService {
  String baseUrl = "http://10.163.10.206:8000/api/";

  Future<List<Book>?> getdatabook(String url) async {
    final response = await http.get(Uri.parse('${url}books'));
    final Iterable data = json.decode(response.body);

    List<Book> alluser = data.map((e) => Book.fromJson(e)).toList();
    return alluser;
  }

  Future<List<Category>?> getdataCategory(String url) async {
    final response = await http.get(Uri.parse('${url}categories'));
    final Iterable data = json.decode(response.body);

    List<Category> alluser = data.map((e) => Category.fromJson(e)).toList();
    return alluser;
  }

  Future<List<Book>?> getBookbyCategory(String id, String url) async {
    final response = await http.get(Uri.parse('${url}categories/$id/books'));

    final Iterable data = json.decode(response.body);

    List<Book> alluser = data.map((e) => Book.fromJson(e)).toList();

    return alluser;
  }

  Future<void> createdatabook(
      {required String title,
      required String author,
      required int year,
      required String url,
      required String category_id}) async {
    var category = await getdataCategory(url);
    var item = category!.firstWhere((e) => e.name.toString() == category_id).id;
    final response = await http.post(Uri.parse('${url}books'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'title': title,
          'author': author,
          'year': year,
          'category_id': item
        }));

    if (response.statusCode == 201) {
    } else {
      throw Exception('Failed to post data');
    }
  }

  Future<void> createdatacategories({
    required String name,
    required String url,
  }) async {
    final response = await http.post(Uri.parse('${url}categories'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'name': name,
        }));

    if (response.statusCode == 201) {
    } else {
      throw Exception('Failed to post data');
    }
  }

  Future<void> editdatabook(
      {required String id,
      required String title,
      required String author,
      required int year,
      required String url,
      required String category_id}) async {
    var category = await getdataCategory(url);
    var item = category!.firstWhere((e) => e.name.toString() == category_id).id;

    await http.put(Uri.parse('${url}books/$id'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'title': title,
          'author': author,
          'year': year,
          'category_id': item
        }));
  }

  Future<void> deletedatabook({
    required String id,
    required String url,
  }) async {
    await http.delete(
      Uri.parse('${url}books/$id'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
  }

  Future<List<String>> getcategoryListName({required String url}) async {
    final response = await http.get(Uri.parse('${url}categories'));
    final Iterable data = json.decode(response.body);

    List<String> alluser = data.map((e) => Category.fromJson(e).name!).toList();

    return alluser;
  }
}
