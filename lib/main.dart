import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:salloon_app/config/theme/app_colors.dart';
import 'package:salloon_app/core/constant/loader.dart';
import 'package:salloon_app/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:salloon_app/features/auth/presentation/pages/auth_page.dart';
import 'package:salloon_app/features/booking/presentation/bloc/booking/booking_bloc.dart';
import 'package:salloon_app/features/hirtory/presentation/bloc/history/history_bloc.dart';
import 'package:salloon_app/features/home/presentation/bloc/get_uid/get_uid_bloc.dart';
import 'package:salloon_app/features/home/presentation/bloc/saloon/saloon_bloc.dart';
import 'package:salloon_app/features/home/presentation/pages/homoe_screen.dart';
import 'package:salloon_app/firebase_options.dart';
import 'package:salloon_app/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUpLoacator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator<AuthBloc>()),
        BlocProvider(create: (context) => locator<SaloonBloc>()),
        BlocProvider(create: (context) => locator<BookingBloc>()),
        BlocProvider(create: (context) => locator<HistoryBloc>()),
        BlocProvider(create: (context) => locator<GetUidBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Saloon',
        theme: ThemeData(
          primarySwatch: AppColors.whiteMaterialColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, AsyncSnapshot<User?> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return const HomeScreen();
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loader();
            }

            return const OnboardingScreen();
          },
        ),
      ),
    );
  }
}
