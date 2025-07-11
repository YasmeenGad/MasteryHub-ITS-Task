import 'package:mastery_hub_its_task/core/networking/common/api_result.dart';
import 'package:mastery_hub_its_task/features/search/domain/entities/response/search_response_entity.dart';

abstract class SearchOnlineDataSource {
  Future<DataResult<SearchResponseEntity>> search(String query);
}
