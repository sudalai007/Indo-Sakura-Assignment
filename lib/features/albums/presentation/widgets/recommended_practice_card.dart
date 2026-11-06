import 'package:flutter/material.dart';
import 'package:indo_sakura_assignment/core/constants/app_images.dart';
import 'package:indo_sakura_assignment/core/widgets/round_button.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/album_entity.dart';

class RecommendedPracticeCard extends StatelessWidget {
  final RecommendedPracticeEntity item;
  final VoidCallback? onAdd;

  const RecommendedPracticeCard({
    super.key,
    required this.item,
    this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    Color iconBg;
    Color iconColor;
    IconData icon;

    if (item.iconType == 'heart') {
      iconBg = const Color(0xFFFEF3C7);
      iconColor = const Color(0xFFF59E0B);
      icon = Icons.favorite_border_rounded;
    } else if (item.iconType == 'soul') {
      iconBg = const Color(0xFFCCFBF1);
      iconColor = const Color(0xFF0F766E);
      icon = Icons.remove_red_eye_outlined;
    } else {
      iconBg = const Color(0xFFE0E7FF);
      iconColor = const Color(0xFF4338CA);
      icon = Icons.public_rounded;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
              color: iconBg,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        item.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.circle,
                        size: 5, color: AppColors.liveCyan),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  item.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  item.meta,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          const RoundButton(
            image: AppImages.add,
            backgroundColor: AppColors.background,
          ),
          // IconButton(
          //   onPressed: onAdd,
          //   icon: Container(
          //     width: 28,
          //     height: 28,
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       border: Border.all(color: AppColors.border),
          //     ),
          //     child: const Icon(Icons.add_rounded, color: AppColors.primary, size: 18),
          //   ),
          // ),
        ],
      ),
    );
  }
}
