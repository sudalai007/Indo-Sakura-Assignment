import '../entities/sanctuary_entity.dart';

abstract class SanctuaryRepository {
  Future<SanctuaryHomeData> getSanctuaryHomeData();
}

