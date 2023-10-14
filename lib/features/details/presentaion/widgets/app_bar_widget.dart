// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:salloon_app/config/theme/app_colors.dart';
import 'package:salloon_app/features/details/presentaion/widgets/backgorund_image.dart';
import 'package:salloon_app/features/details/presentaion/widgets/titel.dart';
import 'package:salloon_app/features/home/domain/entities/saloon_entity.dart';

class AppBarWidget extends StatelessWidget {
  final SaloonEntity saloonEntity;
  const AppBarWidget({
    Key? key,
    required this.saloonEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: false,
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      expandedHeight: 630.0,
      backgroundColor: Colors.white,
      elevation: 0.0,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsetsDirectional.only(start: 0, bottom: 30.0),
        title: Titile(
          location: saloonEntity.saloonLocation,
          nameOfSaloon: saloonEntity.saloonName,
        ),
        background: BagroundImage(image: saloonEntity.saloonImage),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          height: 40.0,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(70.0),
              topRight: Radius.circular(70.0),
            ),
          ),
          child: Container(
            width: 50.0,
            height: 7.0,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(100.0),
            ),
          ),
        ),
      ),
      leadingWidth: 80.0,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.colorPrimary,
          size: 35,
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: const Icon(
            Icons.favorite_border,
            color: AppColors.colorPrimary,
            size: 35,
          ),
        ),
      ],
    );
  }
}
