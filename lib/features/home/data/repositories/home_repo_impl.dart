import 'package:injectable/injectable.dart';
import 'package:mastery_hub_its_task/core/networking/common/api_result.dart';
import 'package:mastery_hub_its_task/features/home/data/data_sources/online/contracts/get_books_online_data_source.dart';
import 'package:mastery_hub_its_task/features/home/domain/contracts/home_repo.dart';
import 'package:mastery_hub_its_task/features/home/domain/entities/response/get_books_response_entity.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final GetBooksOnlineDataSource _onlineDataSource;

  @factoryMethod
  const HomeRepoImpl(this._onlineDataSource);

  @override
  Future<DataResult<GetBooksResponseEntity>> getBooks() async {
    return _onlineDataSource.getBooks();
  }
}
