import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:salute/data/providers/auth_provider.dart';
import 'package:salute/data/providers/category_provider.dart';
import 'package:salute/main.dart';
import 'package:salute/view/components/default_button.dart';
import 'package:salute/view/components/registration_components/custom_check_box.dart';
import 'package:salute/view/components/registration_components/date_picker_field.dart';
import 'package:salute/view/components/registration_components/gender_widget.dart';
import 'package:salute/view/components/registration_components/sign_with_social_media.dart';
import 'package:salute/constants.dart';
import '../../components/default_form_field.dart';
import '../../components/registration_components/password_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String routeName = "SignupScreen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isLoading = false;
  bool isSuccess = true;
  final _formKey = GlobalKey<FormState>();
  void signup() async {

    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    //phoneNumberController.text="+2"+phoneNumberController.text;
    _formKey.currentState!.save();
    isSuccess = true;

    if (!Provider.of<AuthProvider>(context, listen: false).isTermsChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
          content: Text("${AppLocalizations.of(context)!.terms_agree}"
             ),
        ),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });
    await Provider.of<AuthProvider>(context, listen: false)
        .createUser(
      name: nameController.text,
      email: emailController.text,
      gender: Provider.of<AuthProvider>(context, listen: false).gender,
      roleId: 2,
      phoneNumber: "+2"+phoneNumberController.text,
      birthday: birthdayController.text,
      password: passwordController.text,
    )
        .catchError((error) {
      isSuccess = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error)),
      );
      setState(() {
        isLoading = false;
      });
    }).then((_) async {
      setState(() {
        isLoading = false;
      });
      if (isSuccess) {
        await Provider.of<CategoryProvider>(context, listen: false)
            .getTakeawayCategoriesFromApi()
            .then((_) {
          Navigator.pushReplacementNamed(
              context, MyHomePage.routeName);
        });
      }
    });
  }

  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/salute_logo.png")),
                const SizedBox(
                  height: 12,
                ),
                // SignWithSocialMedia(
                //   title: "${AppLocalizations.of(context)!.signup_w}"
                // ),
                // const SizedBox(
                //   height: 12,
                // ),
                Text(
                    "${AppLocalizations.of(context)!.name}",
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
                    if (value!.isEmpty) {
                      return "${AppLocalizations.of(context)!.name_va}";
                    }
                    return null;
                  },
                  controller: nameController,
                  keyboardType: TextInputType.name,
                ),
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
                    if (value!.isEmpty || value.length < 6) {
                      return "${AppLocalizations.of(context)!.password_va2}";
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
                Text(
                    "${AppLocalizations.of(context)!.number}",
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
                  hintText: "+20102345678",
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 184, 184, 184)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "${AppLocalizations.of(context)!.number_va1}";
                    }
                    else if (value.length==11) {
                      return "${AppLocalizations.of(context)!.number_va1}";
                    }
                    // else if (value.length==11) {
                    //   return "Please enter a valid phone number";
                    // }
                    return null;
                  },
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                ),
                const GenderWidget(),
                const SizedBox(
                  height: 12,
                ),
                Text(
                    "${AppLocalizations.of(context)!.dateOfBirth}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                DatePickerField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "${AppLocalizations.of(context)!.birthday_va1}";
                    } else if (DateTime(int.parse(value.substring(0, 3)))
                        .isAfter(DateTime(2008))) {
                      return "${AppLocalizations.of(context)!.birthday_va2}";
                    }
                    return null;
                  },
                  controller: birthdayController,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                      CustomCheckBox(
                      title: "${AppLocalizations.of(context)!.agree}",
                    ),
                    GestureDetector(
                      onTap: () {},
                      child:   Text(
                        "${AppLocalizations.of(context)!.terms}",
                        style: TextStyle(
                          color: kTermsAndConditionsColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                     Text("${AppLocalizations.of(context)!.and}",),
                    GestureDetector(
                      onTap: () {},
                      child:  Text(
                        "${AppLocalizations.of(context)!.conditions}" ,
                        style: TextStyle(
                          color: kTermsAndConditionsColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                isLoading
                    ? kCircularLoadingProgress
                    : DefaultButton(
                        text: "${AppLocalizations.of(context)!.continuee}",
                        onTap: signup,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
