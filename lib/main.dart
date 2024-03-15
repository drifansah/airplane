import 'package:appdua/cubit/auth_cubit.dart';
import 'package:appdua/cubit/destinations_cubit.dart';
import 'package:appdua/cubit/page_cubit.dart';
import 'package:appdua/cubit/seat_cubit.dart';
import 'package:appdua/cubit/transaction_cubit.dart';
import 'package:appdua/ui/pages/bonus_page.dart';
import 'package:appdua/ui/pages/choose_seat_page.dart';
import 'package:appdua/ui/pages/get_started_page.dart';
import 'package:appdua/ui/pages/main_page.dart';
import 'package:appdua/ui/pages/sign_in_page.dart';
import 'package:appdua/ui/pages/sign_up_page.dart';
import 'package:appdua/ui/pages/splash_page.dart';
import 'package:appdua/ui/pages/succes_checout_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        //MENAMBAHKAN AUTHCUBIT
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        //MENAMBAHKAN DESTINATION CUBIT
        BlocProvider(
          create: (context) => DestinationsCubit(),
        ),
        //MENAMBAHKAN SEAT CUBIT
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/get-started': (context) => GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/bonus': (context) => BonusPage(),
          '/main': (context) => MainPage(),
          '/success':(context) => SuccesCheckoutPage(),
        },
      ),
    );
  }
}
