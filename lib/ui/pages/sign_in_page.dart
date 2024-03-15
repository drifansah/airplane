import 'package:appdua/cubit/auth_cubit.dart';
import 'package:appdua/shared/theme.dart';
import 'package:appdua/ui/widgets/custom_button.dart';
import 'package:appdua/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  //MENAMBAHKAN TEKS EDITING CONTROLLER UNTUK MENGHENDEL NILAI PERUBAHAN DARI SETIAP TEKSFORMFIELD

  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwwordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Text(
          "Sign In with our\nexisting account",
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget inputSection() {
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

      Widget submitBotton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            // TODO: implement listener
            //JIKA SUCCES
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/main', (route) => false);
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
              title: "Sign In",
              onPressed: () {
                print(passwwordController.text);
                context.read<AuthCubit>().signIn(
                      email: emailController.text,
                      password: passwwordController.text,
                    );
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
            emailInput(),
            passwordInput(),
            submitBotton(),
          ],
        ),
      );
    }

    Widget tacButton() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/sign-up');
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: 50,
            bottom: 73,
          ),
          child: Text(
            "Don\'t have an account? Sign Up",
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
          children: [
            title(),
            inputSection(),
            tacButton(),
          ],
        ),
      ),
    );
  }
}
