import 'package:injectable/injectable.dart';
import 'package:mastery_hub_its_task/features/home/domain/contracts/home_repo.dart';

import '../../../../core/networking/common/api_result.dart';
import '../entities/response/get_books_response_entity.dart';

@injectable
class GetBooksUseCase {
  final HomeRepo _repo;

  const GetBooksUseCase(this._repo);

  Future<DataResult<GetBooksResponseEntity>> call() => _repo.getBooks();
}
