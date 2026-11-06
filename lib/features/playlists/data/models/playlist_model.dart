import '../../domain/entities/playlist_entity.dart';

class PlaylistModel extends PlaylistEntity {
  const PlaylistModel({
    required super.id,
    required super.code,
    required super.title,
    required super.meta,
    required super.subtitle,
  });

  factory PlaylistModel.fromJson(Map<String, dynamic> json) {
    return PlaylistModel(
      id: json['id'] ?? '',
      code: json['code'] ?? '',
      title: json['title'] ?? '',
      meta: json['meta'] ?? '',
      subtitle: json['subtitle'] ?? '',
    );
  }
}

