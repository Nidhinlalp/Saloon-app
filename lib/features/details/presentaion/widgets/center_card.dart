// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:salloon_app/config/theme/app_colors.dart';

class CenterCard extends StatelessWidget {
  final String discountposter;
  const CenterCard({
    Key? key,
    required this.discountposter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                image: NetworkImage(
                  discountposter,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_arrow_outlined,
                  size: 40,
                  color: AppColors.kButtonColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
