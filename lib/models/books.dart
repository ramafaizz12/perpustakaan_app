import 'package:json_annotation/json_annotation.dart';

part 'books.g.dart';

@JsonSerializable()
class Books {
  final int? id;
  final String title;
  final String author;
  final int year;
  final int category_id;

  Books(
      {this.id,
      required this.title,
      required this.author,
      required this.year,
      required this.category_id});

  factory Books.fromJson(Map<String, dynamic> data) => _$BooksFromJson(data);

  Map<String, dynamic> toJson() => _$BooksToJson(this);
}
