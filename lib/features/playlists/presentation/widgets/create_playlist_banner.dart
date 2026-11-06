import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class CreatePlaylistBanner extends StatelessWidget {
  final VoidCallback? onTap;

  const CreatePlaylistBanner({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: const LinearGradient(
            colors: [Color(0xFFFFF0F5), Color(0xFFF3E8FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: const Color(0xFFE9D5FF), width: 1.2),
          boxShadow: const [
            BoxShadow(
              color: Color(0x129333EA),
              blurRadius: 16,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x15000000),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: const Icon(
                Icons.add_rounded,
                color: AppColors.primary,
                size: 24,
              ),
            ),
            const SizedBox(width: 14),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create Sacred Playlist',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Curate your daily sadhana, Twin Hearts, or meditation sessions.',
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.textSecondary,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.auto_awesome_rounded,
              color: Color(0xFFC084FC),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:indo_sakura_assignment/core/constants/app_images.dart';
// import '../../../../core/constants/app_colors.dart';
// import '../../../../core/constants/app_styles.dart';
// import '../controllers/playlist_controller.dart';
// import '../widgets/create_playlist_banner.dart';
// import '../widgets/playlist_item_card.dart';

// class PlaylistsScreen extends ConsumerStatefulWidget {
//   const PlaylistsScreen({super.key});

//   @override
//   ConsumerState<PlaylistsScreen> createState() => _PlaylistsScreenState();
// }

// class _PlaylistsScreenState extends ConsumerState<PlaylistsScreen>
//     with SingleTickerProviderStateMixin {
//   late final TabController _tabController;
//   final List<String> _filters = [
//     'Recent',
//     'Created',
//     'Most Played',
//     'Sacred OM'
//   ];

//   @override
//   void initState() {
//     super.initState();
//     final initialFilter = ref.read(selectedPlaylistFilterProvider);
//     final initialIndex = _filters.indexOf(initialFilter);
//     _tabController = TabController(
//       length: _filters.length,
//       vsync: this,
//       initialIndex: initialIndex >= 0 ? initialIndex : 0,
//     );
//     _tabController.addListener(() {
//       if (!_tabController.indexIsChanging) {
//         ref.read(selectedPlaylistFilterProvider.notifier).state =
//             _filters[_tabController.index];
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final playlistsAsync = ref.watch(playlistsProvider);

//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.fromLTRB(20, 16, 20, 90),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Playlists',
//                     style: AppStyles.headingLarge,
//                   ),
//                   Container(
//                     width: 40,
//                     height: 40,
//                     decoration: const BoxDecoration(
//                       color: AppColors.background,
//                       shape: BoxShape.circle,
//                       boxShadow: [AppColors.softShadow],
//                     ),
//                     child: Center(
//                       child: SvgPicture.asset(
//                         AppImages.search,
//                         width: 15,
//                         height: 15,
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                   ),
//                   // Container(
//                   //   width: 40,
//                   //   height: 40,
//                   //   decoration: const BoxDecoration(
//                   //     color: AppColors.background,
//                   //     shape: BoxShape.circle,
//                   //   ),
//                   //   child: SvgPicture.asset(
//                   //     AppImages.search,
//                   //     width: 10,
//                   //     height: 10,
//                   //   ),
//                   // ),
//                 ],
//               ),
//               const SizedBox(height: 14),

//               // TabBar with TabController
//               // SizedBox(
//               //   height: 38,
//               //   child: TabBar(
//               //     controller: _tabController,
//               //     isScrollable: true,
//               //     tabAlignment: TabAlignment.start,
//               //     dividerColor: Colors.transparent,
//               //     indicatorSize: TabBarIndicatorSize.tab,
//               //     indicator: BoxDecoration(
//               //       color: AppColors.textPrimary,
//               //       borderRadius: BorderRadius.circular(20),
//               //       //  boxShadow: const [AppColors.softShadow],
//               //     ),
//               //     labelColor: Colors.white,
//               //     unselectedLabelColor: AppColors.textSecondary,
//               //     labelStyle: const TextStyle(
//               //       fontSize: 12,
//               //       fontWeight: FontWeight.w600,
//               //     ),
//               //     unselectedLabelStyle: const TextStyle(
//               //       fontSize: 12,
//               //       fontWeight: FontWeight.w600,
//               //     ),
//               //     padding: EdgeInsets.zero,
//               //     labelPadding: const EdgeInsets.only(right: 8),
//               //     splashFactory: NoSplash.splashFactory,
//               //     overlayColor: WidgetStateProperty.all(Colors.transparent),
//               //     onTap: (index) {
//               //       ref.read(selectedPlaylistFilterProvider.notifier).state =
//               //           _filters[index];
//               //     },
//               //     tabs: _filters.map((filter) {
//               //       return Tab(
//               //         height: 36,
//               //         child: Container(
//               //           padding: const EdgeInsets.symmetric(
//               //               horizontal: 16, vertical: 8),
//               //           decoration: BoxDecoration(
//               //             borderRadius: BorderRadius.circular(20),
//               //             border: Border.all(color: AppColors.border),
//               //           ),
//               //           child: Center(child: Text(filter)),
//               //         ),
//               //       );
//               //     }).toList(),
//               //   ),
//               // ),

//               SizedBox(
//                 height: 38,
//                 child: TabBar(
//                   controller: _tabController,
//                   isScrollable: true,
//                   tabAlignment: TabAlignment.start,
//                   dividerColor: Colors.transparent,
//                   indicatorSize: TabBarIndicatorSize.tab,

//                   // Selected tab background
//                   indicator: BoxDecoration(
//                     color: AppColors.textPrimary,
//                     borderRadius: BorderRadius.circular(20),
//                   ),

//                   labelColor: Colors.white,
//                   unselectedLabelColor: AppColors.textSecondary,

//                   labelStyle: const TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                   ),

//                   unselectedLabelStyle: const TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w600,
//                   ),

//                   padding: EdgeInsets.zero,
//                   labelPadding: const EdgeInsets.only(right: 8),

//                   splashFactory: NoSplash.splashFactory,
//                   overlayColor: WidgetStateProperty.all(
//                     Colors.transparent,
//                   ),

//                   onTap: (index) {
//                     ref.read(selectedPlaylistFilterProvider.notifier).state =
//                         _filters[index];
//                   },

//                   tabs: _filters.map((filter) {
//                     return Tab(
//                       height: 36,
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 8,
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),

//                           // Keep the border only on unselected tabs
//                           border: Border.all(
//                             color: _filters[_tabController.index] == filter
//                                 ? Colors.transparent
//                                 : AppColors.border,
//                           ),
//                         ),
//                         child: Center(
//                           child: Text(filter),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Create Sacred Playlist Banner
//               CreatePlaylistBanner(
//                 onTap: () {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Create playlist dialog'),
//                       behavior: SnackBarBehavior.floating,
//                     ),
//                   );
//                 },
//               ),
//               const SizedBox(height: 22),

//               // Playlist Items with ListView.separated
//               playlistsAsync.when(
//                 loading: () => const Center(
//                   child: Padding(
//                     padding: EdgeInsets.all(32.0),
//                     child: CircularProgressIndicator(color: AppColors.primary),
//                   ),
//                 ),
//                 error: (err, stack) => Center(child: Text('Error: $err')),
//                 data: (playlists) => ListView.separated(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   padding: EdgeInsets.zero,
//                   itemCount: playlists.length,
//                   separatorBuilder: (context, index) =>
//                       const SizedBox(height: 14),
//                   itemBuilder: (context, index) {
//                     final pl = playlists[index];
//                     return PlaylistItemCard(
//                       playlist: pl,
//                       onPlay: () {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('Playing ${pl.title}'),
//                             duration: const Duration(seconds: 1),
//                             behavior: SnackBarBehavior.floating,
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
