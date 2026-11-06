// import 'package:flutter/material.dart';
// import '../../../../core/constants/app_colors.dart';
// import '../../domain/entities/sanctuary_entity.dart';

// class DailyWisdomCard extends StatelessWidget {
//   final WisdomQuote quote;

//   const DailyWisdomCard({super.key, required this.quote});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(22),
//         gradient: const LinearGradient(
//           colors: [
//             AppColors.bannerDarkBlue,
//             AppColors.bannerBlue,
//             AppColors.bannerlightBlue,
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         boxShadow: const [
//           BoxShadow(
//             color: Color(0x33130E26),
//             blurRadius: 20,
//             offset: Offset(0, 8),
//           ),
//         ],
//         border: Border.all(color: const Color(0x14FFFFFF), width: 1),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Header Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   const Icon(Icons.star_rate_rounded,
//                       color: AppColors.amberBadge, size: 16),
//                   const SizedBox(width: 6),
//                   Text(
//                     quote.title,
//                     style: const TextStyle(
//                       fontSize: 11,
//                       fontWeight: FontWeight.w700,
//                       letterSpacing: 1.1,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: const Color(0x1FFFFFFF),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Text(
//                   quote.sutra,
//                   style: const TextStyle(
//                     fontSize: 11,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white70,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),

//           // Quote Text
//           Text(
//             '"${quote.quote}"',
//             style: const TextStyle(
//               fontSize: 13.5,
//               fontWeight: FontWeight.w400,
//               height: 1.5,
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(height: 18),

//           // Author & Action
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 '— ${quote.author}',
//                 style: const TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.white70,
//                 ),
//               ),
//               Row(
//                 children: [
//                   Text(
//                     quote.actionLabel,
//                     style: const TextStyle(
//                       fontSize: 11,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFFC084FC),
//                     ),
//                   ),
//                   const SizedBox(width: 4),
//                   const Icon(
//                     Icons.north_east_rounded,
//                     size: 13,
//                     color: Color(0xFFC084FC),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:indo_sakura_assignment/core/constants/app_images.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final PageController _pageController = PageController();

  int _currentIndex = 0;

  final List<String> _banners = [
    AppImages.banner,
    AppImages.banner,
    AppImages.banner
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _banners.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SvgPicture.asset(
                      _banners[index],
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.deepPurple.shade100,
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.image,
                            size: 48,
                          ),
                        );
                      },
                    )),
              );
            },
          ),
        ),

        const SizedBox(height: 12),

        // Bottom indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _banners.length,
            (index) {
              final bool isActive = _currentIndex == index;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: isActive ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: isActive
                      ? Colors.deepPurple
                      : Colors.deepPurple.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            },
          ),
        ),

        // const SizedBox(height: 8),

        // // Current banner / total banners
        // Text(
        //   '${_currentIndex + 1} / ${_banners.length}',
        //   style: const TextStyle(
        //     fontSize: 12,
        //     color: Colors.grey,
        //   ),
        // ),
      ],
    );
  }
}
