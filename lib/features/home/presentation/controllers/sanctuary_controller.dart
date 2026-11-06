import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/sanctuary_local_datasource.dart';
import '../../data/repositories/sanctuary_repository_impl.dart';
import '../../domain/entities/sanctuary_entity.dart';
import '../../domain/repositories/sanctuary_repository.dart';

final sanctuaryDataSourceProvider = Provider<SanctuaryLocalDataSource>((ref) {
  return SanctuaryLocalDataSourceImpl();
});

final sanctuaryRepositoryProvider = Provider<SanctuaryRepository>((ref) {
  final ds = ref.watch(sanctuaryDataSourceProvider);
  return SanctuaryRepositoryImpl(ds);
});

final sanctuaryHomeDataProvider = FutureProvider<SanctuaryHomeData>((ref) async {
  final repo = ref.watch(sanctuaryRepositoryProvider);
  return repo.getSanctuaryHomeData();
});

