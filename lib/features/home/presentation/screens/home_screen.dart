import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';
import '../controllers/sanctuary_controller.dart';
import '../widgets/daily_wisdom_card.dart';
import '../widgets/featured_album_card.dart';
import '../widgets/popular_meditations_carousel.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeDataAsync = ref.watch(sanctuaryHomeDataProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: homeDataAsync.when(
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          ),
          error: (err, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline_rounded,
                    color: Colors.redAccent, size: 40),
                const SizedBox(height: 12),
                Text('Error loading sanctuary data: $err'),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => ref.refresh(sanctuaryHomeDataProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
          data: (data) => SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Greeting & Live Stream Pill
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: 'Happy ',
                              style: AppStyles.headingLarge,
                              children: [
                                TextSpan(
                                  text: 'Friday',
                                  style: TextStyle(
                                    foreground: Paint()
                                      ..shader = const LinearGradient(
                                        colors: [
                                          AppColors.primaryGradientEnd,
                                          AppColors.lotusPink,
                                        ],
                                      ).createShader(
                                        const Rect.fromLTWH(0, 0, 150, 50),
                                      ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Text.rich(
                          //   TextSpan(
                          //     text: 'Happy ',
                          //     style: AppStyles.headingLarge,
                          //     children: [
                          //       WidgetSpan(
                          //         child: ShaderMask(
                          //           shaderCallback: (bounds) {
                          //             return const LinearGradient(
                          //               colors: [
                          //                 AppColors.primaryGradientEnd,
                          //                 AppColors.lotusPink,
                          //               ],
                          //             ).createShader(bounds);
                          //           },
                          //           child: Text(
                          //             'Friday',
                          //             style: AppStyles.headingLarge.copyWith(
                          //               color: Colors.white,
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          const SizedBox(height: 4),
                          const Text(
                            'Harmonize the Throat & Crown Chakras today',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.border),
                        boxShadow: const [AppColors.softShadow],
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.circle,
                              color: AppColors.liveCyan, size: 8),
                          SizedBox(width: 5),
                          Text(
                            'Live Stream',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),

                // Search Bar
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.border),
                    boxShadow: const [AppColors.softShadow],
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search_rounded,
                          color: AppColors.textMuted, size: 20),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText:
                                'Search mantras, Twin Hearts, affirmati...',
                            hintStyle: TextStyle(
                                fontSize: 13, color: AppColors.textMuted),
                            border: InputBorder.none,
                            isDense: true,
                          ),
                        ),
                      ),
                      Icon(Icons.tune_rounded,
                          color: AppColors.textSecondary, size: 18),
                    ],
                  ),
                ),
                const SizedBox(height: 22),

                // Daily Arhatic Wisdom Card
                const BannerCarousel(),
                const SizedBox(height: 24),

                // Featured Album Card
                FeaturedAlbumCard(
                  album: data.featuredAlbum,
                  onPlay: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Playing ${data.featuredAlbum.title}'),
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 26),

                // Popular Meditations Section
                PopularMeditationsCarousel(
                  meditations: data.popularMeditations,
                  onSelect: (meditation) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Selected ${meditation.title}'),
                        duration: const Duration(seconds: 1),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 75),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
