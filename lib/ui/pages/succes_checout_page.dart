import 'package:appdua/cubit/page_cubit.dart';
import 'package:appdua/shared/theme.dart';
import 'package:appdua/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccesCheckoutPage extends StatelessWidget {
  const SuccesCheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 150,
              margin: EdgeInsets.only(bottom: 80),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/image_success.png",
                  ),
                ),
              ),
            ),
            Text(
              "Well Booked",
              style: blackTextStyle.copyWith(
                fontSize: 32,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Are you ready to explore the new\nworld of experience?",
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
              textAlign: TextAlign.center,
            ),
            CustomButton(
              title: "My Bookings",
              onPressed: () {
                context.read<PageCubit>().setPage(1);
                Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
              },
              widht: 220,
              margin: EdgeInsets.only(top: 50),
            ),
          ],
        ),
      ),
    );
  }
}
