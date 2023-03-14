import 'package:flutter/material.dart';
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
    _formKey.currentState!.save();
    isSuccess = true;

    if (!Provider.of<AuthProvider>(context, listen: false).isTermsChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please agree to terms and conditions"),
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
      phoneNumber: phoneNumberController.text,
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
                const SignWithSocialMedia(
                  title: "Sign up with",
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Name",
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
                      return "Please enter a valid name";
                    }
                    return null;
                  },
                  controller: nameController,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Email",
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
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Password",
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
                      return 'Enter a valid password has more than 6 characters';
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
                const Text(
                  "Phone Number",
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
                      return 'Please enter a valid phone number';
                    }
                    else if (value[0] != '+') {
                      return "Please add your country code";
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
                const Text(
                  "Birthday",
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
                      return 'Please enter a valid birthday date';
                    } else if (DateTime(int.parse(value.substring(0, 3)))
                        .isAfter(DateTime(2008))) {
                      return "You must be older than 16 years old";
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
                    const CustomCheckBox(
                      title: "I agree to ",
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Terms",
                        style: TextStyle(
                          color: kTermsAndConditionsColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text(" and "),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Conditions",
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
                        text: "Continue",
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
