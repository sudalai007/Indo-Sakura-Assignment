import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:indo_sakura_assignment/core/constants/app_images.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_styles.dart';

class EmptySanctuaryWidget extends StatelessWidget {
  final VoidCallback? onExplore;

  const EmptySanctuaryWidget({super.key, this.onExplore});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        SizedBox(
          height: 300,
          child: SvgPicture.asset(
            AppImages.scaredLotus,
            // height: 150,
            // width: 150,
          ),
        ),
        // Center(
        //   child: Stack(
        //     alignment: Alignment.center,
        //     children: [
        //       Container(
        //         width: 170,
        //         height: 170,
        //         decoration: BoxDecoration(
        //           shape: BoxShape.circle,
        //           border: Border.all(
        //             color: const Color(0x99EDE9FE),
        //             width: 1.5,
        //           ),
        //         ),
        //       ),
        //       Container(
        //         width: 130,
        //         height: 130,
        //         decoration: BoxDecoration(
        //           shape: BoxShape.circle,
        //           border: Border.all(
        //             color: const Color(0xCCFBCFE8),
        //             width: 2,
        //           ),
        //         ),
        //       ),
        //       Container(
        //         width: 90,
        //         height: 90,
        //         decoration: BoxDecoration(
        //           shape: BoxShape.circle,
        //           color: Colors.white,
        //           boxShadow: const [
        //             BoxShadow(
        //               color: Color(0x1AEC4899),
        //               blurRadius: 20,
        //               offset: Offset(0, 6),
        //             )
        //           ],
        //           border: Border.all(
        //             color: const Color(0x4DEC4899),
        //             width: 1.5,
        //           ),
        //         ),
        //         child:  Center(
        //           child: Image.asset(AppImages.lotus)
        //           // child: Icon(
        //           //   Icons.spa_rounded,
        //           //   size: 40,
        //           //   color: AppColors.lotusPink,
        //           // ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        const SizedBox(height: 24),

        // Title
        const Text(
          'Your Sanctuary is Empty',
          style: AppStyles.headingMedium,
        ),
        const SizedBox(height: 8),

        // Subtitle
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            "You haven't added any Master Choa Kok Sui meditation albums to your sacred library yet.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.5,
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Button
        Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF6B38FB), Color(0xFF7C3AED)],
            ),
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [
              BoxShadow(
                color: Color(0x356B38FB),
                blurRadius: 14,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: InkWell(
            onTap: onExplore,
            borderRadius: BorderRadius.circular(22),
            child: const Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'EXPLORE DISCOGRAPHY',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.8,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward_rounded,
                      color: Colors.white, size: 16),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
