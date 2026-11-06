import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/playlist_entity.dart';

class PlaylistItemCard extends StatelessWidget {
  final PlaylistEntity playlist;
  final VoidCallback? onPlay;

  const PlaylistItemCard({
    super.key,
    required this.playlist,
    this.onPlay,
  });

  @override
  Widget build(BuildContext context) {
    Color badgeBg;
    Color badgeTextColor;
    IconData badgeIcon;

    if (playlist.code == 'TH-01') {
      badgeBg = const Color(0xFFFFEDD5);
      badgeTextColor = const Color(0xFFC2410C);
      badgeIcon = Icons.wb_sunny_outlined;
    } else if (playlist.code == 'AURA') {
      badgeBg = const Color(0xFFEDE9FE);
      badgeTextColor = const Color(0xFF6B21A8);
      badgeIcon = Icons.nightlight_round_outlined;
    } else {
      badgeBg = const Color(0xFFFCE7F3);
      badgeTextColor = const Color(0xFFBE185D);
      badgeIcon = Icons.self_improvement_rounded;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
        boxShadow: const [AppColors.softShadow],
      ),
      child: Row(
        children: [
          // Badge square
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: badgeBg,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(badgeIcon, size: 16, color: badgeTextColor),
                const SizedBox(height: 2),
                Text(
                  playlist.code,
                  style: TextStyle(
                    fontSize: 8.5,
                    fontWeight: FontWeight.w800,
                    color: badgeTextColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  playlist.meta,
                  style: const TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w600,
                    color: AppColors.amberBadge,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  playlist.title,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  playlist.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          // Action button
          IconButton(
            onPressed: onPlay,
            icon: Icon(
              playlist.code == 'AURA' ? Icons.shuffle_rounded : Icons.play_arrow_rounded,
              color: AppColors.primary,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}

