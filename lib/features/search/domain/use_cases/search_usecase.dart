import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../contracts/search_repo.dart';
import '../entities/response/search_response_entity.dart';

@injectable
class SearchUseCase {
  final SearchRepo _repo;

  SearchUseCase(this._repo);

  Future<DataResult<SearchResponseEntity>> call(String query) async =>
      await _repo.search(query);
}
