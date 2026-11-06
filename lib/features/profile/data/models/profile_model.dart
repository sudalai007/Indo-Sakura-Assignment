import '../../domain/entities/profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  const UserProfileModel({
    required super.name,
    required super.email,
    required super.badge,
    required super.country,
    required super.hoursMeditated,
    required super.dayStreak,
    required super.sacredTracks,
    required super.avatarUrl,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json['name'] ?? 'Samyuktha J',
      email: json['email'] ?? 'samyu@indosakura.com',
      badge: json['badge'] ?? 'ARHATIC PRACTITIONER • LEVEL 1',
      country: json['country'] ?? 'India',
      hoursMeditated: json['hoursMeditated'] ?? 128,
      dayStreak: json['dayStreak'] ?? 45,
      sacredTracks: json['sacredTracks'] ?? 24,
      avatarUrl: json['avatarUrl'] ?? '',
    );
  }
}

class RecentSessionModel extends RecentSessionEntity {
  const RecentSessionModel({
    required super.id,
    required super.title,
    required super.subtitle,
    required super.timestamp,
    required super.colorType,
  });

  factory RecentSessionModel.fromJson(Map<String, dynamic> json) {
    return RecentSessionModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      timestamp: json['timestamp'] ?? '',
      colorType: json['colorType'] ?? 'purple',
    );
  }
}

