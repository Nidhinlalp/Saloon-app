// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:salloon_app/config/theme/app_colors.dart';
import 'package:salloon_app/features/details/presentaion/pages/details_page.dart';

class Titile extends StatelessWidget {
  final String nameOfSaloon;
  final String location;
  const Titile({
    Key? key,
    required this.nameOfSaloon,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (context, value, _) {
        return value == false
            ? FadeInUp(
                child: SafeArea(
                  child: Stack(
                    children: [
                      Positioned(
                        left: 100,
                        top: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              nameOfSaloon,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              textScaleFactor: 1.0,
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                Text(
                                  location,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Stack(
                children: [
                  Positioned(
                    left: 10,
                    bottom: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 24,
                          width: 73,
                          decoration: BoxDecoration(
                            color: AppColors.kButtonColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              'Book Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          textScaleFactor: 1.3,
                          nameOfSaloon,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              location,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              );
      },
    );
  }
}
