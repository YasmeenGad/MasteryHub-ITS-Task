import 'package:injectable/injectable.dart';
import 'package:mastery_hub_its_task/core/networking/common/api_result.dart';
import 'package:mastery_hub_its_task/features/search/data/data_sources/online/contracts/search_online_data_source.dart';
import 'package:mastery_hub_its_task/features/search/domain/entities/response/search_response_entity.dart';

import '../../domain/contracts/search_repo.dart';

@Injectable(as: SearchRepo)
class SearchRepoImpl implements SearchRepo {
  final SearchOnlineDataSource _onlineDataSource;

  @factoryMethod
  SearchRepoImpl(this._onlineDataSource);

  @override
  Future<DataResult<SearchResponseEntity>> search(String query) async {
    return await _onlineDataSource.search(query);
  }
}
