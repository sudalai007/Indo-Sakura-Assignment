import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:indo_sakura_assignment/core/constants/app_images.dart';
import 'package:indo_sakura_assignment/core/widgets/round_button.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';
import '../controllers/album_controller.dart';
import '../widgets/empty_sanctuary_widget.dart';
import '../widgets/recommended_practice_card.dart';

class AlbumsScreen extends ConsumerStatefulWidget {
  const AlbumsScreen({super.key});

  @override
  ConsumerState<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends ConsumerState<AlbumsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  final List<String> filters = [
    'All Albums',
    'Downloaded',
    'Favorites',
    'Chants',
  ];

  @override
  void initState() {
    super.initState();

    final initialFilter = ref.read(selectedAlbumFilterProvider);
    final initialIndex = filters.indexOf(initialFilter);

    _tabController = TabController(
      length: filters.length,
      vsync: this,
      initialIndex: initialIndex >= 0 ? initialIndex : 0,
    );

    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (!_tabController.indexIsChanging) {
      ref.read(selectedAlbumFilterProvider.notifier).state =
          filters[_tabController.index];
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final recommendedAsync = ref.watch(recommendedPracticesProvider);
    final selectedFilter = ref.watch(selectedAlbumFilterProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Albums',
                    style: AppStyles.headingLarge,
                  ),
                  RoundButton(
                    image: AppImages.clock,
                    backgroundColor: AppColors.background,
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.border),
                  boxShadow: const [AppColors.softShadow],
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.search_rounded,
                      color: AppColors.textMuted,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search chants, mantras, sutras...',
                          hintStyle: TextStyle(
                            fontSize: 13,
                            color: AppColors.textMuted,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Filter Tabs
              SizedBox(
                height: 38,
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,

                  // Selected tab background
                  indicator: BoxDecoration(
                    color: const Color(0xFF4F2AB8),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  labelColor: Colors.white,
                  unselectedLabelColor: AppColors.textSecondary,

                  labelStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),

                  unselectedLabelStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),

                  padding: EdgeInsets.zero,
                  labelPadding: const EdgeInsets.only(right: 8),

                  splashFactory: NoSplash.splashFactory,
                  overlayColor: WidgetStateProperty.all(
                    Colors.transparent,
                  ),

                  onTap: (index) {
                    ref.read(selectedAlbumFilterProvider.notifier).state =
                        filters[index];
                  },

                  tabs: filters.map((filter) {
                    final isSelected = selectedFilter == filter;

                    return Tab(
                      height: 36,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected
                                ? Colors.transparent
                                : AppColors.border,
                          ),
                        ),
                        child: Center(
                          child: Text(filter),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 20),

              // Empty Sanctuary State
              EmptySanctuaryWidget(
                onExplore: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Exploring Master Choa Kok Sui Discography...',
                      ),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
              ),

              const SizedBox(height: 32),

              // Recommended Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'RECOMMENDED FOR YOUR PRACTICE',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.1,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 6),

              // Recommended Practices
              recommendedAsync.when(
                loading: () => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  ),
                ),
                error: (err, stack) => Center(
                  child: Text('Error: $err'),
                ),
                data: (list) => Column(
                  children: list.map((item) {
                    return RecommendedPracticeCard(
                      item: item,
                      onAdd: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Added ${item.title} to your sacred library',
                            ),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class AlbumsScreen extends ConsumerWidget {
//   const AlbumsScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final recommendedAsync = ref.watch(recommendedPracticesProvider);
//     final selectedFilter = ref.watch(selectedAlbumFilterProvider);
//     final filters = ['All Albums', 'Downloaded', 'Favorites', 'Chants'];

//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.fromLTRB(20, 16, 20, 90),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'My Albums',
//                     style: AppStyles.headingLarge,
//                   ),
//                   RoundButton(
//                     image: AppImages.clock,
//                     backgroundColor: AppColors.background,
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 14),

//               // Search Bar
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: AppColors.surface,
//                   borderRadius: BorderRadius.circular(16),
//                   border: Border.all(color: AppColors.border),
//                   boxShadow: const [AppColors.softShadow],
//                 ),
//                 child: const Row(
//                   children: [
//                     Icon(Icons.search_rounded,
//                         color: AppColors.textMuted, size: 20),
//                     SizedBox(width: 10),
//                     Expanded(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: 'Search chants, mantras, sutras...',
//                           hintStyle: TextStyle(
//                               fontSize: 13, color: AppColors.textMuted),
//                           border: InputBorder.none,
//                           isDense: true,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // Filter Chips
//               SizedBox(
//                 height: 34,
//                 child: ListView.separated(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: filters.length,
//                   separatorBuilder: (context, index) =>
//                       const SizedBox(width: 8),
//                   itemBuilder: (context, index) {
//                     final filter = filters[index];
//                     final isSelected = filter == selectedFilter;
//                     return GestureDetector(
//                       onTap: () => ref
//                           .read(selectedAlbumFilterProvider.notifier)
//                           .state = filter,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 7),
//                         decoration: BoxDecoration(
//                           color: isSelected
//                               ? const Color(0xFF4F2AB8)
//                               : AppColors.surface,
//                           borderRadius: BorderRadius.circular(18),
//                           border: Border.all(
//                             color: isSelected
//                                 ? const Color(0xFF4F2AB8)
//                                 : AppColors.border,
//                           ),
//                         ),
//                         child: Text(
//                           filter,
//                           style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w600,
//                             color: isSelected
//                                 ? Colors.white
//                                 : AppColors.textSecondary,
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Empty Sanctuary State Illustration & Button
//               EmptySanctuaryWidget(
//                 onExplore: () {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content:
//                           Text('Exploring Master Choa Kok Sui Discography...'),
//                       behavior: SnackBarBehavior.floating,
//                     ),
//                   );
//                 },
//               ),
//               const SizedBox(height: 32),

//               // Section: RECOMMENDED FOR YOUR PRACTICE
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'RECOMMENDED FOR YOUR PRACTICE',
//                     style: TextStyle(
//                       fontSize: 11,
//                       fontWeight: FontWeight.w700,
//                       letterSpacing: 1.1,
//                       color: AppColors.textPrimary,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: const Text(
//                       'View All',
//                       style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w600,
//                         color: AppColors.primary,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 6),

//               recommendedAsync.when(
//                 loading: () => const Center(
//                   child: Padding(
//                     padding: EdgeInsets.all(20.0),
//                     child: CircularProgressIndicator(color: AppColors.primary),
//                   ),
//                 ),
//                 error: (err, stack) => Center(child: Text('Error: $err')),
//                 data: (list) => Column(
//                   children: list.map((item) {
//                     return RecommendedPracticeCard(
//                       item: item,
//                       onAdd: () {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text(
//                                 'Added ${item.title} to your sacred library'),
//                             behavior: SnackBarBehavior.floating,
//                           ),
//                         );
//                       },
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
