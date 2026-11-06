import '../../domain/entities/album_entity.dart';

class RecommendedPracticeModel extends RecommendedPracticeEntity {
  const RecommendedPracticeModel({
    required super.id,
    required super.title,
    required super.subtitle,
    required super.meta,
    required super.iconType,
  });

  factory RecommendedPracticeModel.fromJson(Map<String, dynamic> json) {
    return RecommendedPracticeModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      meta: json['meta'] ?? '',
      iconType: json['iconType'] ?? 'heart',
    );
  }
}

