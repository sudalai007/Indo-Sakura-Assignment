import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_colors.dart';
import 'mini_player_widget.dart';

class MainNavScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainNavScaffold({
    super.key,
    required this.navigationShell,
  });

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Screen child
          Positioned.fill(
            child: navigationShell,
          ),

          // Bottom Bar and Floating Mini Player
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //  const MiniPlayerWidget(),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(24)),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x12000000),
                        blurRadius: 20,
                        offset: Offset(0, -4),
                      ),
                    ],
                    border: Border.all(color: AppColors.border),
                  ),
                  child: SafeArea(
                    top: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildNavItem(
                            index: 0,
                            icon: Icons.home_rounded,
                            label: 'Home',
                            isSelected: navigationShell.currentIndex == 0,
                          ),
                          _buildNavItem(
                            index: 1,
                            icon: Icons.album_outlined,
                            label: 'My Albums',
                            isSelected: navigationShell.currentIndex == 1,
                          ),
                          _buildNavItem(
                            index: 2,
                            icon: Icons.queue_music_rounded,
                            label: 'Playlists',
                            isSelected: navigationShell.currentIndex == 2,
                          ),
                          _buildNavItem(
                            index: 3,
                            icon: Icons.person_outline_rounded,
                            label: 'Profile',
                            isSelected: navigationShell.currentIndex == 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    final color = isSelected ? AppColors.primary : AppColors.textMuted;

    return InkWell(
      onTap: () => _onTap(index),
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontSize: 10.5,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
