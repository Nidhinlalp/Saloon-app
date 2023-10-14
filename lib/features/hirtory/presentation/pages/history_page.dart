import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salloon_app/config/theme/app_colors.dart';
import 'package:salloon_app/core/constant/loader.dart';
import 'package:salloon_app/core/util/utils.dart';
import 'package:salloon_app/features/hirtory/presentation/bloc/history/history_bloc.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HistoryBloc>().add(GetHistory());
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("History Page"),
      ),
      body: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          if (state is HistoryLoading) {
            return const Loader();
          } else if (state is HistoryGetFaild) {
            return Center(child: Text(state.message));
          } else if (state is HistoryGetState) {
            return ListView.builder(
              itemCount: state.bookingData.length,
              itemBuilder: (context, index) {
                var data = state.bookingData[index];
                String dateTimeString = data.date;
                RegExp dateRegex = RegExp(r'(\d{4})-(\d{2})-(\d{2})');

                Match match = dateRegex.firstMatch(dateTimeString) as Match;

                String? year = match.group(1);
                String? month = match.group(2);
                String? day = match.group(3);

                return Container(
                  margin: const EdgeInsets.only(
                    top: 12,
                    bottom: 32,
                    left: kIsWeb ? 50 : 10,
                    right: kIsWeb ? 50 : 10,
                  ),
                  height:
                      kIsWeb ? 200 : MediaQuery.of(context).size.height * .2,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 2),
                      )
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FadeInDown(
                          child: Container(
                            margin: const EdgeInsets.only(),
                            decoration: const BoxDecoration(
                              color: AppColors.kButtonColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Time',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  verticalSpace(10),
                                  Text(
                                    data.time,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.background,
                                        ),
                                  ),
                                  verticalSpace(10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Phone',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Text(
                                        'Price',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                  verticalSpace(10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data.phone,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.background,
                                            ),
                                      ),
                                      Text(
                                        '₹ 500',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.background,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      FadeInUp(
                        child: Container(
                          height: kIsWeb
                              ? 200
                              : MediaQuery.of(context).size.height * .2,
                          width: kIsWeb
                              ? 200
                              : MediaQuery.of(context).size.width * .4,
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0.1,
                                blurRadius: 0.7,
                                offset: const Offset(0, 2),
                              )
                            ],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                month ?? "",
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              Text(
                                day ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      fontSize: 50,
                                      color: AppColors.kButtonColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                year ?? "",
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('some unexpected error occurred'),
            );
          }
        },
      ),
    );
  }
}
