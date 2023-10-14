import 'package:flutter/material.dart';
import 'package:salloon_app/config/theme/app_colors.dart';

class OnSaleButton extends StatelessWidget {
  const OnSaleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 100,
      decoration: BoxDecoration(
        color: AppColors.kButtonColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Text(
          'Book Now',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
