import 'package:appdua/cubit/auth_cubit.dart';
import 'package:appdua/shared/theme.dart';
import 'package:appdua/ui/widgets/custom_button.dart';
import 'package:appdua/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  //MENAMBAHKAN TEKS EDITING CONTROLLER UNTUK MENGHENDEL NILAI PERUBAHAN DARI SETIAP TEKSFORMFIELD
  final TextEditingController nameController = TextEditingController(text: "");
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwwordController =
      TextEditingController(text: "");
  final TextEditingController hobbyController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Text(
          "Join us and get\nyour next journey",
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget nameInput() {
        return CustomTextFormField(
          title: "Full Name",
          hinText: "Your full name",
          controller: nameController,
        );
      }

      Widget emailInput() {
        return CustomTextFormField(
          title: "Email Addres",
          hinText: "Your email addres",
          controller: emailController,
        );
      }

      Widget passwordInput() {
        return CustomTextFormField(
          title: "Password",
          hinText: "Your password",
          obscureText: true,
          controller: passwwordController,
        );
      }

      Widget hobbyInput() {
        return CustomTextFormField(
          title: "Hobby",
          hinText: "Your hobby",
          controller: hobbyController,
        );
      }

      Widget submitBotton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            // TODO: implement listener
            //JIKA SUCCES
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/bonus', (route) => false);
            } else if (state is AuthFailed) {
              //JIKA FAILED
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kRedColor,
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomButton(
              title: "Get Started",
              onPressed: () {
                print(passwwordController.text);
                context.read<AuthCubit>().signUp(
                    email: emailController.text,
                    password: passwwordController.text,
                    name: nameController.text,
                    hobby: hobbyController.text);
              },
            );
          },
        );
      }

      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(
            defaultRadius,
          ),
        ),
        child: Column(
          children: [
            nameInput(),
            emailInput(),
            passwordInput(),
            hobbyInput(),
            submitBotton(),
          ],
        ),
      );
    }

    Widget signInButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/sign-in");
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: 50,
            bottom: 73,
          ),
          child: Text(
            "have a account? Sign In",
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: [title(), inputSection(), signInButton()],
        ),
      ),
    );
  }
}
