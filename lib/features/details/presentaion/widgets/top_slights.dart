import 'package:flutter/material.dart';
import 'package:salloon_app/config/theme/app_colors.dart';

class TopSlights extends StatelessWidget {
  const TopSlights({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 80,
          width: 150,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: NetworkImage(
                "https://i.insider.com/59f39d4bd3684049008b4688?width=700",
              ),
              fit: BoxFit.cover,
            ),
            color: AppColors.colorSecondaryV2,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Styles and Trends',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                'Fashion is characterized by ever-changing styles and trends.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.colorSecondaryDark,
                      letterSpacing: 0,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
