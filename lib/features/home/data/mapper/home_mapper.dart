import '../../domain/entities/response/get_books_response_entity.dart';
import '../models/response/get_books_response_dto.dart';

class HomeMapper {
  static GetBooksResponseEntity toEntity(GetBooksResponseDto dto) =>
      GetBooksResponseEntity(
          title: dto.title,
          id: dto.id,
          author: dto.author,
          genre: dto.genre,
          yearPublished: dto.yearPublished);
}
