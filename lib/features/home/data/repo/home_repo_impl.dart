import 'package:fapp_setup/features/home/data/sources/home_data_source.dart';
import 'package:fapp_setup/features/home/domain/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  //
  final HomeDataSource _dataSource;

  HomeRepoImpl(this._dataSource);
}
