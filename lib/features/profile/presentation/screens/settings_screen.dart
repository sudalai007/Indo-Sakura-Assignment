import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';
import '../controllers/profile_controller.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProfileProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textPrimary, size: 20),
          onPressed: () => context.pop(),
        ),
        title: const Column(
          children: [
            Text(
              'Settings & Practice',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              'PRANIC HEALING SANCTUARY',
              style: TextStyle(
                fontSize: 9.5,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.1,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.spa_rounded, color: AppColors.lotusPink, size: 22),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Card
            userAsync.when(
              loading: () => const SizedBox.shrink(),
              error: (err, stack) => const SizedBox.shrink(),
              data: (user) => Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.border),
                  boxShadow: const [AppColors.softShadow],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundColor: AppColors.lavender,
                      backgroundImage: NetworkImage(user.avatarUrl),
                      onBackgroundImageError: (_, __) {},
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            user.email,
                            style: const TextStyle(
                              fontSize: 11.5,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Text(
                            'Edit',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          Icon(Icons.chevron_right_rounded, size: 16, color: AppColors.primary),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // PRACTICE & AUDIO
            _buildSectionHeader('PRACTICE & AUDIO'),
            _buildSettingTile(
              icon: Icons.graphic_eq_rounded,
              iconColor: AppColors.primary,
              title: 'Audio Quality & Binaural Beats',
              subtitle: 'Hi-Res Lossless • 432 Hz',
              onTap: () {},
            ),
            _buildSettingTile(
              icon: Icons.download_done_rounded,
              iconColor: AppColors.lotusPink,
              title: 'Offline Sanctuary & Downloads',
              subtitle: '6 guided meditations available',
              onTap: () {},
            ),
            _buildSettingTile(
              icon: Icons.notifications_none_rounded,
              iconColor: AppColors.amberBadge,
              title: 'Daily Sadhana Reminders',
              subtitle: 'Twin Hearts • 6:30 AM Daily',
              onTap: () {},
            ),
            const SizedBox(height: 20),

            // ACCOUNT & PREFERENCES
            _buildSectionHeader('ACCOUNT & PREFERENCES'),
            _buildSettingTile(
              icon: Icons.favorite_border_rounded,
              iconColor: AppColors.lotusPink,
              title: 'Wishlist & Sacred Bookmarks',
              subtitle: '12 saved',
              onTap: () {},
            ),
            _buildSettingTile(
              icon: Icons.translate_rounded,
              iconColor: const Color(0xFF0284C7),
              title: 'Language / भाषा',
              subtitle: 'English',
              onTap: () {},
            ),
            _buildSettingTile(
              icon: Icons.lock_outline_rounded,
              iconColor: const Color(0xFF6366F1),
              title: 'Security & Password',
              subtitle: 'Fingerprint & Passcode enabled',
              onTap: () {},
            ),
            const SizedBox(height: 20),

            // PRANIC HEALING TRUST & INFO
            _buildSectionHeader('PRANIC HEALING TRUST & INFO'),
            _buildSettingTile(
              icon: Icons.menu_book_rounded,
              iconColor: const Color(0xFF059669),
              title: 'About Master Choa Kok Sui & Teachings',
              onTap: () {},
            ),
            _buildSettingTile(
              icon: Icons.public_rounded,
              iconColor: const Color(0xFF0D9488),
              title: 'Global Meditation Centers',
              onTap: () {},
            ),
            _buildSettingTile(
              icon: Icons.shield_outlined,
              iconColor: const Color(0xFF475569),
              title: 'Terms & Privacy Policy',
              onTap: () {},
            ),
            const SizedBox(height: 20),

            // Delete Account
            _buildSettingTile(
              icon: Icons.delete_outline_rounded,
              iconColor: Colors.redAccent,
              title: 'Delete Account & Data',
              textColor: Colors.redAccent,
              onTap: () {},
            ),
            const SizedBox(height: 16),

            // Logout Button
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
                boxShadow: const [AppColors.softShadow],
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () async {
                  await ref.read(authControllerProvider.notifier).signOut();
                  if (context.mounted) {
                    context.go('/login');
                  }
                },
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout_rounded, color: AppColors.primary, size: 18),
                      SizedBox(width: 8),
                      Text(
                        'LOGOUT',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.8,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'End Session →',
                        style: TextStyle(
                          fontSize: 11,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Footer
            const Center(
              child: Column(
                children: [
                  Text(
                    'Pranic Healing Sounds • v3.4.2 (2026)',
                    style: TextStyle(fontSize: 11, color: AppColors.textMuted),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Inner Sanctuary • Light and Love',
                    style: TextStyle(fontSize: 10, color: AppColors.textMuted),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.1,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    String? subtitle,
    Color? textColor,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        boxShadow: const [AppColors.softShadow],
      ),
      child: ListTile(
        onTap: onTap,
        dense: true,
        leading: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: iconColor, size: 18),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: textColor ?? AppColors.textPrimary,
          ),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 11,
                  color: AppColors.textMuted,
                ),
              )
            : null,
        trailing: const Icon(Icons.chevron_right_rounded, size: 18, color: AppColors.textMuted),
      ),
    );
  }
}
