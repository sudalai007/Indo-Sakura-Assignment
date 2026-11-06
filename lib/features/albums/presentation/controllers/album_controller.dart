import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/album_model.dart';
import '../../domain/entities/album_entity.dart';

final recommendedPracticesProvider = FutureProvider<List<RecommendedPracticeEntity>>((ref) async {
  final jsonString = await rootBundle.loadString('assets/data/static.json');
  final Map<String, dynamic> decoded = jsonDecode(jsonString);
  final list = decoded['recommended'] as List<dynamic>? ?? [];
  return list.map((e) => RecommendedPracticeModel.fromJson(e as Map<String, dynamic>)).toList();
});

final selectedAlbumFilterProvider = StateProvider<String>((ref) => 'All Albums');

