import 'package:flutter/material.dart';
import 'package:salute/components/default_button.dart';
import 'package:salute/main.dart';
import 'package:salute/screens/registration_screens/sign_in_screen.dart';
import 'package:salute/screens/registration_screens/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const String routeName = "WelcomeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/login_wallpaper.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(),
              Image.asset("assets/images/salute_logo.png"),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              DefaultButton(
                text: "Sign in",
                onTap: () =>
                    Navigator.pushNamed(context, SignInScreen.routeName),
              ),
              const SizedBox(
                height: 18,
              ),
              DefaultButton(
                text: "Register",
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, SignUpScreen.routeName);
                },
              ),
              const SizedBox(
                height: 18,
              ),
              DefaultButton(
                text: "Continue as a guest",
                backgroundColor: Colors.transparent,
                borderColor: Colors.white,
                onTap: () {
                  Navigator.pushReplacementNamed(context, MyHomePage.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
