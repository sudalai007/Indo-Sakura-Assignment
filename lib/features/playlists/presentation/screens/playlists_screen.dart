import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:indo_sakura_assignment/core/constants/app_images.dart';
import 'package:indo_sakura_assignment/core/widgets/round_button.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';
import '../controllers/playlist_controller.dart';
import '../widgets/create_playlist_banner.dart';
import '../widgets/playlist_item_card.dart';

class PlaylistsScreen extends ConsumerStatefulWidget {
  const PlaylistsScreen({super.key});

  @override
  ConsumerState<PlaylistsScreen> createState() => _PlaylistsScreenState();
}

class _PlaylistsScreenState extends ConsumerState<PlaylistsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final List<String> _filters = [
    'Recent',
    'Created',
    'Most Played',
    'Sacred OM'
  ];

  @override
  void initState() {
    super.initState();
    final initialFilter = ref.read(selectedPlaylistFilterProvider);
    final initialIndex = _filters.indexOf(initialFilter);
    _tabController = TabController(
      length: _filters.length,
      vsync: this,
      initialIndex: initialIndex >= 0 ? initialIndex : 0,
    );
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        ref.read(selectedPlaylistFilterProvider.notifier).state =
            _filters[_tabController.index];
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final playlistsAsync = ref.watch(playlistsProvider);

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
                    'Playlists',
                    style: AppStyles.headingLarge,
                  ),
                  RoundButton(
                    image: AppImages.search,
                    backgroundColor: AppColors.background,
                  ),
                ],
              ),
              const SizedBox(height: 14),

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
                    color: AppColors.textPrimary,
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
                    ref.read(selectedPlaylistFilterProvider.notifier).state =
                        _filters[index];
                  },

                  tabs: _filters.map((filter) {
                    return Tab(
                      height: 36,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),

                          // Keep the border only on unselected tabs
                          border: Border.all(
                            color: _filters[_tabController.index] == filter
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

              // Create Sacred Playlist Banner
              CreatePlaylistBanner(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Create playlist dialog'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
              ),
              const SizedBox(height: 22),

              // Playlist Items with ListView.separated
              playlistsAsync.when(
                loading: () => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(32.0),
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
                ),
                error: (err, stack) => Center(child: Text('Error: $err')),
                data: (playlists) => ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: playlists.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 14),
                  itemBuilder: (context, index) {
                    final pl = playlists[index];
                    return PlaylistItemCard(
                      playlist: pl,
                      onPlay: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Playing ${pl.title}'),
                            duration: const Duration(seconds: 1),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
