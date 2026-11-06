import '../../domain/entities/sanctuary_entity.dart';

class WisdomQuoteModel extends WisdomQuote {
  const WisdomQuoteModel({
    required super.title,
    required super.sutra,
    required super.quote,
    required super.author,
    required super.actionLabel,
  });

  factory WisdomQuoteModel.fromJson(Map<String, dynamic> json) {
    return WisdomQuoteModel(
      title: json['title'] ?? 'DAILY ARHATIC WISDOM',
      sutra: json['sutra'] ?? 'Sutra 108',
      quote: json['quote'] ?? '',
      author: json['author'] ?? 'Master Choa Kok Sui',
      actionLabel: json['actionLabel'] ?? 'Deep Contemplation',
    );
  }
}

class FeaturedAlbumModel extends FeaturedAlbum {
  const FeaturedAlbumModel({
    required super.id,
    required super.title,
    required super.subtitle,
    required super.tag,
    required super.description,
    required super.duration,
  });

  factory FeaturedAlbumModel.fromJson(Map<String, dynamic> json) {
    return FeaturedAlbumModel(
      id: json['id'] ?? 'feat_1',
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      tag: json['tag'] ?? '',
      description: json['description'] ?? '',
      duration: json['duration'] ?? '32:45',
    );
  }
}

class PopularMeditationModel extends PopularMeditation {
  const PopularMeditationModel({
    required super.id,
    required super.title,
    required super.subtitle,
    required super.category,
    required super.duration,
  });

  factory PopularMeditationModel.fromJson(Map<String, dynamic> json) {
    return PopularMeditationModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      category: json['category'] ?? '',
      duration: json['duration'] ?? '',
    );
  }
}

class SanctuaryHomeDataModel extends SanctuaryHomeData {
  const SanctuaryHomeDataModel({
    required super.dailyWisdom,
    required super.featuredAlbum,
    required super.popularMeditations,
  });

  factory SanctuaryHomeDataModel.fromJson(Map<String, dynamic> json) {
    final wisdomJson = json['dailyWisdom'] as Map<String, dynamic>? ?? {};
    final albumJson = json['featuredAlbum'] as Map<String, dynamic>? ?? {};
    final popularList = (json['popularMeditations'] as List<dynamic>? ?? [])
        .map((e) => PopularMeditationModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return SanctuaryHomeDataModel(
      dailyWisdom: WisdomQuoteModel.fromJson(wisdomJson),
      featuredAlbum: FeaturedAlbumModel.fromJson(albumJson),
      popularMeditations: popularList,
    );
  }
}

