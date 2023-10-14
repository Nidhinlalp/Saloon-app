// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:salloon_app/features/details/presentaion/pages/details_page.dart';

class BagroundImage extends StatelessWidget {
  final String image;
  const BagroundImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (context, value, child) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: value == true
              ? null
              : BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.500),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
