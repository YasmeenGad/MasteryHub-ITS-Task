import '../../../home/domain/entities/response/get_books_response_entity.dart';
import '../../domain/entities/reading_status_entity.dart';
import '../models/reading_status_model.dart';

class ReadingStatusMapper {
  static ReadingStatusModel toModel(ReadingStatusEntity entity) {
    return ReadingStatusModel(
      userId: entity.userId,
      status: entity.status,
      bookData: entity.bookData,
    );
  }

  static ReadingStatusEntity toEntity(ReadingStatusModel model) {
    return ReadingStatusEntity(
      userId: model.userId,
      status: model.status,
      bookData: model.bookData,
    );
  }

  static Map<String, dynamic> bookToMap(GetBooksResponseEntityItems book) {
    return {
      'id': book.id,
      'kind': book.kind,
      'etag': book.etag,
      'selfLink': book.selfLink,
      'volumeInfo': {
        'title': book.volumeInfo?.title,
        'authors': book.volumeInfo?.authors,
        'description': book.volumeInfo?.description,
        'imageLinks': {
          'thumbnail': book.volumeInfo?.imageLinks?.thumbnail,
        },
      },
    };
  }
}
