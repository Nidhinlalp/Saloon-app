import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:salloon_app/config/theme/app_colors.dart';
import 'package:salloon_app/core/util/utils.dart';
import 'package:salloon_app/features/details/presentaion/widgets/on_sale_buton.dart';

class SearchFlictButton extends StatelessWidget {
  const SearchFlictButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      duration: const Duration(milliseconds: 400),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Container(
          height: 59,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.kgredintColor1,
                AppColors.kgredintColor1,
              ],
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.book_outlined,
                    size: 35,
                    color: Colors.white,
                  ),
                  horizontalSpace(5),
                  const Text(
                    'Book Your Own',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const OnSaleButton()
            ],
          ),
        ),
      ),
    );
  }
}
