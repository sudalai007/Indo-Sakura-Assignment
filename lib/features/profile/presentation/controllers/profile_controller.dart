import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/profile_model.dart';
import '../../domain/entities/profile_entity.dart';

final userProfileProvider = FutureProvider<UserProfileEntity>((ref) async {
  final jsonString = await rootBundle.loadString('assets/data/static.json');
  final Map<String, dynamic> decoded = jsonDecode(jsonString);
  return UserProfileModel.fromJson(decoded['user'] as Map<String, dynamic>? ?? {});
});

final recentSessionsProvider = FutureProvider<List<RecentSessionEntity>>((ref) async {
  final jsonString = await rootBundle.loadString('assets/data/static.json');
  final Map<String, dynamic> decoded = jsonDecode(jsonString);
  final list = decoded['recentSessions'] as List<dynamic>? ?? [];
  return list.map((e) => RecentSessionModel.fromJson(e as Map<String, dynamic>)).toList();
});

final spiritualQuoteProvider = FutureProvider<String>((ref) async {
  final jsonString = await rootBundle.loadString('assets/data/static.json');
  final Map<String, dynamic> decoded = jsonDecode(jsonString);
  return decoded['spiritualQuote'] as String? ?? '';
});

final selectedProfileTabProvider = StateProvider<String>((ref) => 'Recently Played');

