// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Books _$BooksFromJson(Map<String, dynamic> json) => Books(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String,
      author: json['author'] as String,
      year: (json['year'] as num).toInt(),
      category_id: (json['category_id'] as num).toInt(),
    );

Map<String, dynamic> _$BooksToJson(Books instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'year': instance.year,
      'category_id': instance.category_id,
    };
