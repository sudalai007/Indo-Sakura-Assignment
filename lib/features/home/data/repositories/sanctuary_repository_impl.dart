import '../../domain/entities/sanctuary_entity.dart';
import '../../domain/repositories/sanctuary_repository.dart';
import '../datasources/sanctuary_local_datasource.dart';

class SanctuaryRepositoryImpl implements SanctuaryRepository {
  final SanctuaryLocalDataSource _dataSource;

  SanctuaryRepositoryImpl(this._dataSource);

  @override
  Future<SanctuaryHomeData> getSanctuaryHomeData() async {
    return await _dataSource.getSanctuaryHomeData();
  }
}

