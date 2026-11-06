import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:indo_sakura_assignment/core/constants/app_colors.dart';

class RoundButton extends StatelessWidget {
  final String image;
  final Color backgroundColor;
  const RoundButton(
      {super.key,
      required this.image,
      this.backgroundColor = AppColors.background});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        boxShadow: const [AppColors.softShadow],
      ),
      child: Center(
        child: SvgPicture.asset(
          image,
          width: 15,
          height: 15,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
