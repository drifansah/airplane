import 'package:appdua/shared/theme.dart';
import 'package:appdua/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/image_get_started.png",
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Fly Like a Bird",
                    style: whiteTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Explore new world with us and lot\nyour get an amazing experience",
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  CustomButton(
                    title: "Get Started",
                    widht: 220,
                    margin: EdgeInsets.only(
                      top: 50,
                      bottom: 80,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/sign-up");
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
