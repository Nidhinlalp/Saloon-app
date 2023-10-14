import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salloon_app/config/theme/app_colors.dart';
import 'package:salloon_app/config/theme/fonts.dart';
import 'package:salloon_app/config/theme/images.dart';
import 'package:salloon_app/core/constant/loader.dart';
import 'package:salloon_app/core/util/utils.dart';
import 'package:salloon_app/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:salloon_app/responsive/responsive.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  Images.kImgOnboarding,
                  height: Utility.screenHeight(context) * 0.5,
                ),
                const Text(
                  "Book your favourite\nHair Stylist",
                  style: textStyleDarkHeavy24px800,
                ),
                verticalSpace(20.0),
                const Text(
                  "We can help you to choose your new favourite stylist within the second",
                  style: textStyleSubText16px500w,
                ),
                verticalSpace(25.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return InkWell(
                        onTap: state is GoogelAuthLoadingState
                            ? null
                            : () =>
                                context.read<AuthBloc>().add(LoginPressed()),
                        child: state is GoogelAuthLoadingState
                            ? const Loader()
                            : Container(
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  color: AppColors.colorSecondary,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(32.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0,
                                    vertical: 18.0,
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(Images.googleImage,
                                          width: 50),
                                      const Text(
                                        "Get Register With Googel",
                                        style: textStyleWhite16px600w,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
