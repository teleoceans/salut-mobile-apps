import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/providers/favorites_provider.dart';
import 'package:salute/screens/faq_screen/about_us.dart';
import 'package:salute/screens/faq_screen/app_feedback.dart';
import 'package:salute/screens/faq_screen/faq.dart';
import 'package:salute/screens/faq_screen/policy_screen.dart';
import 'package:salute/screens/faq_screen/terms_of_use_screen.dart';
import 'package:salute/screens/home_screens/favorites_screen.dart';
import 'package:salute/screens/profile_screens/account_info_screen.dart';
import 'package:salute/screens/profile_screens/add_address_screen.dart';
import 'package:salute/screens/profile_screens/change_email.dart';
import 'package:salute/screens/profile_screens/change_password.dart';
import 'package:salute/screens/profile_screens/no_address_screen.dart';
import 'package:salute/screens/profile_screens/settings_screen.dart';
import 'package:salute/screens/registration_screens/facing_problem_screen.dart';
import 'package:salute/screens/registration_screens/allow_location_screen.dart';
import 'package:salute/screens/registration_screens/check_email.dart';
import 'package:salute/screens/registration_screens/enter_code_screen.dart';
import 'package:salute/screens/registration_screens/forget_password.dart';
import 'package:salute/screens/registration_screens/help_tkafol_screen.dart';
import 'package:salute/screens/registration_screens/order_anywhere_screen.dart';
import 'package:salute/screens/registration_screens/sign_in_screen.dart';
import 'package:salute/screens/registration_screens/signup_screen.dart';
import 'package:salute/screens/registration_screens/welcome_screen.dart';
import 'package:salute/screens/registration_screens/wohoo_screen.dart';
import 'package:salute/screens/home_screens/cart_screen.dart';
import 'package:salute/screens/home_screens/catering_screen.dart';
import 'package:salute/screens/home_screens/home_screen.dart';
import 'package:salute/screens/home_screens/profile_screen.dart';
import 'package:salute/screens/shopping_screens/checkout_screen.dart';
import 'package:salute/screens/shopping_screens/product_screen.dart';
import 'package:salute/screens/shopping_screens/track_order_screen.dart';

import 'components/global_drawer.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FavoritesProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(primary: Colors.black.withOpacity(0.6)),
          unselectedWidgetColor: Colors.white,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
        ),
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          CateringScreen.routeName: (context) => const CateringScreen(),
          ProfileScreen.routeName: (context) => const ProfileScreen(),
          FavoritesScreen.routeName: (context) => const FavoritesScreen(),
          SignInScreen.routeName: (context) => const SignInScreen(),
          ForgetPasswordScreen.routeName: (context) =>
              const ForgetPasswordScreen(),
          CheckYourEmailScreen.routeName: (context) =>
              const CheckYourEmailScreen(),
          EnterCodeScreen.routeName: (context) => const EnterCodeScreen(),
          SignUpScreen.routeName: (context) => SignUpScreen(),
          AllowLocationScreen.routeName: (context) =>
              const AllowLocationScreen(),
          OrderAnywhereScreen.routeName: (context) =>
              const OrderAnywhereScreen(),
          HelpWithTkafolScreen.routeName: (context) =>
              const HelpWithTkafolScreen(),
          FacingProblemScreen.routeName: (context) =>
              const FacingProblemScreen(),
          WohooScreen.routeName: (context) => const WohooScreen(),
          MyHomePage.routeName: (context) => const MyHomePage(),
          FaqScreen.routeName: (context) => const FaqScreen(),
          AboutUsScreen.routeName: (context) => const AboutUsScreen(),
          TermsOfUseScreen.routeName: (context) => const TermsOfUseScreen(),
          PolicyScreen.routeName: (context) => const PolicyScreen(),
          AppFeedbackScreen.routeName: (context) => const AppFeedbackScreen(),
          SettingsScreen.routeName: (context) => const SettingsScreen(),
          AccountInfoScreen.routeName: (context) => const AccountInfoScreen(),
          ChangeEmailScreen.routeName: (context) => const ChangeEmailScreen(),
          ChangePasswordScreen.routeName: (context) =>
              const ChangePasswordScreen(),
          NoAddressScreen.routeName: (context) => const NoAddressScreen(),
          AddAddressScreen.routeName: (context) => const AddAddressScreen(),
          ProductDetailsScreen.routeName: (context) =>
              const ProductDetailsScreen(),
          CheckoutScreen.routeName: (context) => const CheckoutScreen(),
          TrackOrderScreen.routeName: (context) => const TrackOrderScreen(),
        },
        home: const WelcomeScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  static const String routeName = "HomePage";
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    const FavoritesScreen(),
    const CateringScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  void setPage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: currentIndex == 3 || currentIndex == 1,
        drawer: currentIndex == 3 || currentIndex == 1 || currentIndex == 2
            ? null
            : const GlobalDrawer(),
        appBar: currentIndex == 2
            ? null
            : currentIndex == 1
                ? AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  )
                : currentIndex == 3
                    ? AppBar(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        leading: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: kPrimaryColor,
                            size: 30,
                          ),
                          onPressed: () {
                            setPage(0);
                          },
                        ),
                        title: const Text(
                          "My Cart",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),
                      )
                    : AppBar(
                        elevation: 0,
                        centerTitle: true,
                        backgroundColor: kPrimaryColor,
                        title: Image.asset(
                          "assets/images/salut_text_white.png",
                          width: 80,
                        ),
                        actions: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications,
                              size: 28,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              size: 28,
                              Icons.favorite,
                            ),
                          ),
                        ],
                      ),
        //extendBody: true,
        body: pages[currentIndex],
        floatingActionButton: currentIndex == 3
            ? null
            : SizedBox(
                height: 70,
                width: 70,
                child: FittedBox(
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    child: Image.asset('assets/images/catering_icon.png'),
                    onPressed: () {
                      setPage(2);
                    },
                  ),
                ),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: currentIndex == 3
            ? null
            : BottomAppBar(
                notchMargin: 10,
                shape: const CircularNotchedRectangle(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 8),
                      iconSize: currentIndex == 0 ? 43 : 40,
                      onPressed: () {
                        setPage(0);
                      },
                      icon: Image.asset(
                        currentIndex == 0
                            ? 'assets/images/home_focused.png'
                            : 'assets/images/home_unfocused.png',
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setPage(1);
                      },
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 8,
                      ),
                      iconSize: currentIndex == 1 ? 45 : 41,
                      icon: Image.asset(
                        currentIndex == 1
                            ? 'assets/images/favorite_focused.png'
                            : 'assets/images/favorite_unfocused.png',
                      ),
                    ),
                    IconButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 8),
                      iconSize: 43,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.abc,
                        size: 0,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setPage(3);
                      },
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 8),
                      iconSize: currentIndex == 3 ? 43 : 40,
                      icon: Image.asset(
                        currentIndex == 3
                            ? 'assets/images/cart_focused.png'
                            : 'assets/images/cart_unfocused.png',
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setPage(4);
                      },
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 8),
                      iconSize: currentIndex == 4 ? 43 : 40,
                      icon: Image.asset(
                        currentIndex == 4
                            ? 'assets/images/profile_focused.png'
                            : 'assets/images/profile_unfocused.png',
                      ),
                    ),
                  ],
                ),
              ),
      );
}
