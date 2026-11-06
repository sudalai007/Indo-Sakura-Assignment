class UserProfileEntity {
  final String name;
  final String email;
  final String badge;
  final String country;
  final int hoursMeditated;
  final int dayStreak;
  final int sacredTracks;
  final String avatarUrl;

  const UserProfileEntity({
    required this.name,
    required this.email,
    required this.badge,
    required this.country,
    required this.hoursMeditated,
    required this.dayStreak,
    required this.sacredTracks,
    required this.avatarUrl,
  });
}

class RecentSessionEntity {
  final String id;
  final String title;
  final String subtitle;
  final String timestamp;
  final String colorType;

  const RecentSessionEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.timestamp,
    required this.colorType,
  });
}

