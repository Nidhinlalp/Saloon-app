// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:salloon_app/config/theme/app_colors.dart';
import 'package:salloon_app/config/theme/fonts.dart';
import 'package:salloon_app/core/util/utils.dart';
import 'package:salloon_app/features/booking/presentation/page/booking_page.dart';
import 'package:salloon_app/features/details/presentaion/widgets/horizontal_list.dart';
import 'package:salloon_app/features/home/domain/entities/saloon_entity.dart';

class WebDetailsPage extends StatelessWidget {
  final SaloonEntity saloonEntity;
  const WebDetailsPage({
    Key? key,
    required this.saloonEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          label: const Row(
            children: [
              Icon(Icons.book_outlined),
              Text(
                "Book Now",
              )
            ],
          ),
          onPressed: () => Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => BookingPage(saLoonUid: saloonEntity.uid),
            ),
          ),
        ),
        appBar: AppBar(
          title: Text(saloonEntity.saloonName),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                saloonEntity.saloonLocation,
                style: textStyle28px700w,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          image: DecorationImage(
                            image: NetworkImage(
                              saloonEntity.disCountPoster,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .6,
                      ),
                      verticalSpace(MediaQuery.of(context).size.height * .1),
                    ],
                  ),
                  Positioned(
                    right: 50,
                    bottom: -50,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.height * .4,
                      height: MediaQuery.of(context).size.height * .5,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.network(
                          saloonEntity.saloonImage,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(20),
              const Align(
                alignment: Alignment.topLeft,
                child: HorzontalCategorie(),
              ),
              verticalSpace(50),
            ],
          ),
        ),
      ),
    );
  }
}

class HorzontalCategorie extends StatelessWidget {
  const HorzontalCategorie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Row(
          children: List.generate(
            towerImages.length,
            (index) {
              return Container(
                height: 100,
                width: 90,
                margin: const EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(towerImages[index]),
                    fit: BoxFit.cover,
                  ),
                  color: AppColors.colorPrimaryDark,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.indigo,
                      offset: Offset(0.0, 3.0),
                      blurRadius: 5.0,
                      spreadRadius: -5,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
