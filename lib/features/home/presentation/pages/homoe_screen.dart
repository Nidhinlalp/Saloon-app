import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salloon_app/config/theme/app_colors.dart';
import 'package:salloon_app/config/theme/fonts.dart';
import 'package:salloon_app/config/theme/images.dart';
import 'package:salloon_app/core/constant/loader.dart';
import 'package:salloon_app/core/util/utils.dart';
import 'package:salloon_app/features/details/presentaion/pages/details_page.dart';
import 'package:salloon_app/features/details/presentaion/pages/web_details_page.dart';
import 'package:salloon_app/features/hirtory/presentation/pages/history_page.dart';
import 'package:salloon_app/features/home/presentation/bloc/get_uid/get_uid_bloc.dart';
import 'package:salloon_app/features/home/presentation/bloc/saloon/saloon_bloc.dart';
import 'package:salloon_app/features/home/presentation/widgets/saloon_profile_card.dart';
import 'package:salloon_app/responsive/responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SaloonBloc>().add(GetSaloonsList());
      context.read<GetUidBloc>().add(GetSaloonUid());
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to Saloon"),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: AppColors.kblack,
          ),
        ),
        actions: [
          if (kIsWeb)
            Container(
              padding: const EdgeInsets.only(right: 10),
              width: MediaQuery.of(context).size.width * .5,
              height: 50.0,
              decoration: BoxDecoration(
                border: Border.all(),
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.1),
                    blurRadius: 20.0,
                    spreadRadius: 10.0,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  horizontalSpace(20.0),
                  Image.asset(Images.kIconSearch, height: 24),
                  horizontalSpace(20.0),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: textStyleSubText16px400w,
                        isDense: true,
                      ),
                    ),
                  )
                ],
              ),
            ),
          horizontalSpace(20),
          BlocBuilder<GetUidBloc, GetUidState>(
            builder: (context, state) {
              if (state is GetSaloonUids) {
                return StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("bookings")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("mybookings")
                      .doc(state.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data!.exists) {
                      return IconButton(
                        onPressed: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const HistoryPage(),
                          ),
                        ),
                        icon: const Icon(
                          Icons.history_toggle_off_outlined,
                          size: 25,
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.hasError}");
                    } else {
                      return const SizedBox();
                    }
                  },
                );
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SafeArea(
          child: Responsive(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(20.0),
                if (!kIsWeb)
                  Container(
                    width: Utility.screenWidth(context),
                    height: 60.0,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(32.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.1),
                          blurRadius: 20.0,
                          spreadRadius: 10.0,
                          offset: const Offset(0, 10),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        horizontalSpace(20.0),
                        Image.asset(Images.kIconSearch, height: 24),
                        horizontalSpace(20.0),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search",
                              hintStyle: textStyleSubText16px400w,
                              isDense: true,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                verticalSpace(20.0),
                Expanded(
                  child: BlocBuilder<SaloonBloc, SaloonState>(
                    builder: (context, state) {
                      if (state is SaloonListLoading) {
                        return const Loader();
                      } else if (state is SaloonListGetFaild) {
                        return Center(
                          child: Text(state.message.toString()),
                        );
                      } else if (state is SaloonListGet) {
                        return ListView.separated(
                          itemBuilder: (context, index) {
                            var saloon = state.saloonEntity[index];
                            return GestureDetector(
                              onTap: () {
                                if (kIsWeb) {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => WebDetailsPage(
                                        saloonEntity: saloon,
                                      ),
                                    ),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) =>
                                          DetailsPage(saloonEntity: saloon),
                                    ),
                                  );
                                }
                              },
                              child: SaloonProfileCard(saloonEntity: saloon),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return verticalSpace(10);
                          },
                          itemCount: state.saloonEntity.length,
                        );
                      }
                      return const Center(
                        child: Text(
                          'Some Unexpextd Error occured please try to Restart the Application',
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
