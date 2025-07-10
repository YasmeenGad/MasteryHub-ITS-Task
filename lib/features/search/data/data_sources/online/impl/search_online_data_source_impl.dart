import 'package:injectable/injectable.dart';
import 'package:mastery_hub_its_task/core/networking/api/api_manager.dart';
import 'package:mastery_hub_its_task/core/networking/api_execute.dart';
import 'package:mastery_hub_its_task/core/networking/common/api_result.dart';
import 'package:mastery_hub_its_task/features/search/data/data_sources/online/contracts/search_online_data_source.dart';
import 'package:mastery_hub_its_task/features/search/domain/entities/response/search_response_entity.dart';

import '../../../mapper/search_mapper.dart';

@Injectable(as: SearchOnlineDataSource)
class SearchOnlineDataSourceImpl implements SearchOnlineDataSource {
  final ApiManager _apiManager;

  @factoryMethod
  SearchOnlineDataSourceImpl(this._apiManager);

  @override
  Future<DataResult<SearchResponseEntity>> search(String query) async {
    return executeApi(() async {
      final response = await _apiManager.search(query);
      return SearchMapper.toEntity(response);
    });
  }
}
