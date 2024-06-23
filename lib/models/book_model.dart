import 'package:json_annotation/json_annotation.dart';
import 'package:perpustakaan_app/models/category.dart';

part 'book_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Book {
  final int? id;
  final String title;
  final String author;
  final int year;
  final Category category;

  Book(
      {this.id,
      required this.title,
      required this.author,
      required this.year,
      required this.category});

  factory Book.fromJson(Map<String, dynamic> data) => _$BookFromJson(data);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}
