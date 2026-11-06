import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/profile_entity.dart';

class RecentMeditationTile extends StatelessWidget {
  final RecentSessionEntity session;
  final VoidCallback? onPlay;

  const RecentMeditationTile({
    super.key,
    required this.session,
    this.onPlay,
  });

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color iconColor;
    IconData icon;

    if (session.colorType == 'purple') {
      bg = const Color(0xFFEDE9FE);
      iconColor = const Color(0xFF7C3AED);
      icon = Icons.radio_button_checked_rounded;
    } else if (session.colorType == 'orange') {
      bg = const Color(0xFFFFEDD5);
      iconColor = const Color(0xFFEA580C);
      icon = Icons.temple_buddhist_rounded;
    } else {
      bg = const Color(0xFFCCFBF1);
      iconColor = const Color(0xFF0D9488);
      icon = Icons.star_border_rounded;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
        boxShadow: const [AppColors.softShadow],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  session.title,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  session.subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  session.timestamp,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: onPlay,
            icon: Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFEDE9FE),
              ),
              child: const Icon(
                Icons.play_arrow_rounded,
                color: AppColors.primary,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

