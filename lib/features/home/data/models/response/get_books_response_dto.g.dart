// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_books_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBooksResponseDto _$GetBooksResponseDtoFromJson(Map<String, dynamic> json) =>
    GetBooksResponseDto(
      json['id'] as String?,
      json['title'] as String?,
      json['author'] as String?,
      json['genre'] as String?,
      (json['yearPublished'] as num?)?.toInt(),
      json['checkedOut'] as bool?,
      json['isPermanentCollection'] as bool?,
      json['createdAt'] as String?,
    );

Map<String, dynamic> _$GetBooksResponseDtoToJson(
    GetBooksResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'genre': instance.genre,
      'yearPublished': instance.yearPublished,
      'checkedOut': instance.checkedOut,
      'isPermanentCollection': instance.isPermanentCollection,
      'createdAt': instance.createdAt,
    };
