// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:salloon_app/config/theme/app_colors.dart';
import 'package:salloon_app/config/theme/fonts.dart';
import 'package:salloon_app/config/theme/images.dart';
import 'package:salloon_app/core/util/utils.dart';
import 'package:salloon_app/features/home/domain/entities/saloon_entity.dart';

class SaloonProfileCard extends StatelessWidget {
  final SaloonEntity saloonEntity;
  const SaloonProfileCard({
    Key? key,
    required this.saloonEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Utility.screenWidth(context),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: Border.all(),
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                saloonEntity.saloonName,
                style: textStyleRegular18pxW600,
              ),
              verticalSpace(10.0),
              Text(
                saloonEntity.saloonPersonName,
                style: textStyleSubText14px400w,
              ),
              verticalSpace(10.0),
              Row(
                children: [
                  Image.asset(Images.kIconStar, height: 16.0),
                  horizontalSpace(10.0),
                  Text(
                    saloonEntity.rating,
                    style: textStyleRegular16px500px,
                  ),
                ],
              ),
              verticalSpace(20.0),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.colorSecondary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 12.0,
                  ),
                  child: Text(
                    "View Profile",
                    style: textStyleWhite16px600w,
                  ),
                ),
              ),
            ],
          ),
          horizontalSpace(5),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              saloonEntity.saloonImage,
              height: 190,
            ),
          ),
        ],
      ),
    );
  }
}
