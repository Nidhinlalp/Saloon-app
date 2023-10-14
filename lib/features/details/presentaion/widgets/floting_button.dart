import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:salloon_app/config/theme/app_colors.dart';

class FlotinButton extends StatelessWidget {
  const FlotinButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      duration: const Duration(milliseconds: 250),
      child: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.kgredintColor1,
              AppColors.kgredintColor2,
            ],
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.book_outlined,
            size: 35,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
