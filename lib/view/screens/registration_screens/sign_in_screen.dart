import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/data/providers/auth_provider.dart';
import 'package:salute/main.dart';
import 'package:salute/view/components/default_button.dart';
import 'package:salute/view/components/default_form_field.dart';
import 'package:salute/view/components/registration_components/password_field.dart';
import 'package:salute/view/screens/registration_screens/forget_password.dart';
import 'package:salute/view/components/registration_components/custom_check_box.dart';
import 'package:salute/view/components/registration_components/sign_with_social_media.dart';
import 'package:salute/constants.dart';
import 'package:salute/view/screens/registration_screens/signup_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String routeName = "SignInScreen";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isSuccess = true;
  bool isloading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void login() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      isloading = true;
    });
    isSuccess = true;
    await Provider.of<AuthProvider>(context, listen: false)
        .login(
      email: emailController.text,
      password: passwordController.text,
    ).catchError((error) {
      isSuccess = false;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Your credentials are invalid"),
        ),
      );
    }).then((value) {
      setState(() {
        isloading = false;
      });

      if (isSuccess) {
        Navigator.pushNamedAndRemoveUntil(context, MyHomePage.routeName,(r)=>false);
      }
    });
  }

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
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/salute_logo.png'),
                  ),
                  const SignWithSocialMedia(),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "${AppLocalizations.of(context)!.email}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  DefaultFormField(
                    validator: (value) {
                      if (value!.isEmpty || !value.contains("@")) {
                        return "${AppLocalizations.of(context)!.email_va}";
                      }
                      return null;
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "${AppLocalizations.of(context)!.password}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  PasswordFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "${AppLocalizations.of(context)!.password_va}";
                      }
                      return null;
                    },
                    controller: passwordController,
                    confirmPassword: false,
                    textColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        CustomCheckBox(
                        title: "${AppLocalizations.of(context)!.password_remember2}",//password_remember2
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, ForgetPasswordScreen.routeName);
                        },
                        child:   Text(
                          "${AppLocalizations.of(context)!.password_forget}",
                          style: TextStyle(
                            color: kTermsAndConditionsColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  isloading
                      ? kCircularLoadingProgress
                      : DefaultButton(
                          text: "${AppLocalizations.of(context)!.login}",
                          onTap: login,
                        ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text(
                        "${AppLocalizations.of(context)!.have_account}",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, SignUpScreen.routeName);
                        },
                        child:   Text(
                          "${AppLocalizations.of(context)!.signup}",
                          style: TextStyle(
                            color: kTermsAndConditionsColor,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
