import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:salloon_app/config/theme/app_colors.dart';

class Utility {
  static MediaQueryData? mediaQueryData;
  static double? screenWidths;
  static double? screenHeights;
  static final emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  static double screenWidth(BuildContext context) {
    // print('${MediaQuery.of(context).size.width/1.55}');
    return MediaQuery.of(context).size.width;
  }

  static bool isWeb(BuildContext context) {
    return kIsWeb;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static var paddingSize15Box = const SizedBox(
    height: 15,
  );
  static var paddingSize10Box = const SizedBox(
    height: 10,
  );

  static var paddingSize30Box = const SizedBox(
    height: 30,
  );

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidths = mediaQueryData!.size.width;
    screenHeights = mediaQueryData!.size.height;
  }
}

Widget verticalSpace(double height) => SizedBox(
      height: height,
    );

Widget horizontalSpace(double height) => SizedBox(
      width: height,
    );

Widget line({required double width}) => Container(
      width: width,
      height: 1,
      color: AppColors.lineColor,
    );

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
