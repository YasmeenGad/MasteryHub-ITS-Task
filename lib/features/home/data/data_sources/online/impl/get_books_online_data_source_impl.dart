import 'package:injectable/injectable.dart';
import 'package:mastery_hub_its_task/core/networking/api/api_manager.dart';
import 'package:mastery_hub_its_task/core/networking/api_execute.dart';
import 'package:mastery_hub_its_task/core/networking/common/api_result.dart';
import 'package:mastery_hub_its_task/features/home/data/mapper/home_mapper.dart';
import 'package:mastery_hub_its_task/features/home/domain/entities/response/get_books_response_entity.dart';

import '../contracts/get_books_online_data_source.dart';

@Injectable(as: GetBooksOnlineDataSource)
class GetBooksOnlineDataSourceImpl implements GetBooksOnlineDataSource {
  final ApiManager _apiManager;

  @factoryMethod
  const GetBooksOnlineDataSourceImpl(this._apiManager);

  @override
  Future<DataResult<GetBooksResponseEntity>> getBooks() async {
    return executeApi(() async {
      final response = await _apiManager.getBooks();
      return HomeMapper.toEntity(response);
    });
  }
}
