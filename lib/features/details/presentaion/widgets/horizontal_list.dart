// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:salloon_app/config/theme/app_colors.dart';

List<String> towerImages = [
  "assets/images/cutting.jpeg",
  "assets/images/shaving.jpeg",
  "assets/images/styling.jpeg",
  "assets/images/triming.jpeg",
  "assets/images/Shampooing.jpeg",
];

class HorizontalTowers extends StatefulWidget {
  final ScrollController scrollController;
  const HorizontalTowers({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<HorizontalTowers> createState() => _HorizontalTowersState();
}

class _HorizontalTowersState extends State<HorizontalTowers> {
  double position = 0;
  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(() {
      if (widget.scrollController.hasClients) {
        //log(widget.scrollController.position.pixels.toString());
        if (widget.scrollController.position.pixels > 50 &&
            widget.scrollController.position.pixels < 500) {
          position = 80;
        } else {
          position = 0;
        }

        setState(() {});
      }
    });
  }

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
              double paddingTop = position;

              return AnimatedContainer(
                onEnd: () {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    setState(() {
                      paddingTop = 0;
                    });
                  });
                },
                padding: EdgeInsets.only(top: paddingTop),
                duration: Duration(milliseconds: 200 * index ~/ 2),
                child: Container(
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
