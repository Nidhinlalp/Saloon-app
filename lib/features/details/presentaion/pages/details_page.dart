import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salloon_app/config/theme/fonts.dart';
import 'package:salloon_app/features/booking/presentation/page/booking_page.dart';
import 'package:salloon_app/features/details/presentaion/widgets/app_bar_widget.dart';
import 'package:salloon_app/features/details/presentaion/widgets/center_card.dart';
import 'package:salloon_app/features/details/presentaion/widgets/floting_button.dart';
import 'package:salloon_app/features/details/presentaion/widgets/horizontal_list.dart';
import 'package:salloon_app/features/details/presentaion/widgets/search_flight_button.dart';
import 'package:salloon_app/features/details/presentaion/widgets/top_slights.dart';
import 'package:salloon_app/features/home/domain/entities/saloon_entity.dart';
import 'package:salloon_app/responsive/responsive.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);
ScrollController _scrollController = ScrollController();

class DetailsPage extends StatefulWidget {
  final SaloonEntity saloonEntity;
  const DetailsPage({
    Key? key,
    required this.saloonEntity,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        log(_scrollController.position.pixels.toString());
        scrollNotifier.value = _scrollController.position.pixels < 200;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      child: Scaffold(
        floatingActionButton: GestureDetector(
          onTap: () => Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) =>
                  BookingPage(saLoonUid: widget.saloonEntity.uid),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ValueListenableBuilder(
              valueListenable: scrollNotifier,
              builder: (context, value, _) {
                return value == false
                    ? const SearchFlictButton()
                    : const FlotinButton();
              },
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (context, value, _) {
            return CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
                // ----- > App Bar ------
                AppBarWidget(saloonEntity: widget.saloonEntity),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ------- > Horizontal list Screooll -----
                      HorizontalTowers(scrollController: _scrollController),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 8.0),
                            Text(
                              widget.saloonEntity.categoryDescription,
                              maxLines: 4,
                              style: textStyle12px400w,
                            ),
                            const SizedBox(height: 10.0),
                            Center(
                              child: Text(
                                'READ MORE',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            // ------- > Read More Under Card
                            CenterCard(
                              discountposter:
                                  widget.saloonEntity.disCountPoster,
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              'Top Sights',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 16.0),
                            // ----- > Top Sights Widget
                            const TopSlights(),
                            const SizedBox(height: 80.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
