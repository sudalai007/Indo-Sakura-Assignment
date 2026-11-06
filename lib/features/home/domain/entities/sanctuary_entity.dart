class WisdomQuote {
  final String title;
  final String sutra;
  final String quote;
  final String author;
  final String actionLabel;

  const WisdomQuote({
    required this.title,
    required this.sutra,
    required this.quote,
    required this.author,
    required this.actionLabel,
  });
}

class FeaturedAlbum {
  final String id;
  final String title;
  final String subtitle;
  final String tag;
  final String description;
  final String duration;

  const FeaturedAlbum({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.description,
    required this.duration,
  });
}

class PopularMeditation {
  final String id;
  final String title;
  final String subtitle;
  final String category;
  final String duration;

  const PopularMeditation({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.duration,
  });
}

class SanctuaryHomeData {
  final WisdomQuote dailyWisdom;
  final FeaturedAlbum featuredAlbum;
  final List<PopularMeditation> popularMeditations;

  const SanctuaryHomeData({
    required this.dailyWisdom,
    required this.featuredAlbum,
    required this.popularMeditations,
  });
}

