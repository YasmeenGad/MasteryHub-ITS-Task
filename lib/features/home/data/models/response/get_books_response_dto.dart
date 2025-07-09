import 'package:json_annotation/json_annotation.dart';

part 'get_books_response_dto.g.dart';

@JsonSerializable()
class GetBooksResponseDto {
  final String? id;
  final String? title;
  final String? author;
  final String? genre;
  final int? yearPublished;
  final bool? checkedOut;
  final bool? isPermanentCollection;
  final String? createdAt;

  GetBooksResponseDto(
      this.id,
      this.title,
      this.author,
      this.genre,
      this.yearPublished,
      this.checkedOut,
      this.isPermanentCollection,
      this.createdAt);

  factory GetBooksResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GetBooksResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetBooksResponseDtoToJson(this);
}
