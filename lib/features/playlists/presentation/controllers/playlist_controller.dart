import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/playlist_model.dart';
import '../../domain/entities/playlist_entity.dart';

final playlistsProvider = FutureProvider<List<PlaylistEntity>>((ref) async {
  final jsonString = await rootBundle.loadString('assets/data/static.json');
  final Map<String, dynamic> decoded = jsonDecode(jsonString);
  final list = decoded['playlists'] as List<dynamic>? ?? [];
  return list.map((e) => PlaylistModel.fromJson(e as Map<String, dynamic>)).toList();
});

final selectedPlaylistFilterProvider = StateProvider<String>((ref) => 'Recent');

