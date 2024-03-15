import 'package:appdua/cubit/page_cubit.dart';
import 'package:appdua/shared/theme.dart';
import 'package:appdua/ui/pages/home_page.dart';
import 'package:appdua/ui/pages/seting_page.dart';
import 'package:appdua/ui/pages/transaction_page.dart';
import 'package:appdua/ui/pages/wallet_page.dart';
import 'package:appdua/ui/widgets/custom_bottom_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingPage();
        default:
          return HomePage();
      }
    }

    Widget customButtomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(
              bottom: 30, left: defaultMargin, right: defaultMargin),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottonNavigationItem(
                index: 0,
                imageUrl: "assets/icon_home.png",
                
              ),
              CustomBottonNavigationItem(
                index: 1,
                imageUrl: "assets/icon_booking.png",
               
              ),
              CustomBottonNavigationItem(
                index: 2,
                imageUrl: "assets/icon_card.png",
               
              ),
              CustomBottonNavigationItem(
                index: 3,
                imageUrl: "assets/icon_settings.png",
                
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customButtomNavigation(),
            ],
          ),
        );
      },
    );
  }
}
