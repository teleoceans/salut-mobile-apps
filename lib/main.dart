import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:salute/data/helpers/shared_preferences.dart';
import 'package:salute/data/providers/addresses_provider.dart';
import 'package:salute/data/providers/category_provider.dart';
import 'package:salute/data/providers/current_product_provider.dart';
import 'package:salute/data/providers/notifications_provider.dart';
import 'package:salute/data/providers/products_provider.dart';
import 'package:salute/data/providers/shopping_provider.dart';
import 'package:salute/view/components/default_button.dart';
import 'package:salute/view/components/default_form_field.dart';
import 'package:salute/view/components/shopping_components/social_media_container.dart';
import 'package:salute/view/components/shopping_components/tkafol_container.dart';
import 'package:salute/view/screens/faq_screen/about_us.dart';
import 'package:salute/view/screens/faq_screen/app_feedback.dart';
import 'package:salute/view/screens/faq_screen/faq.dart';
import 'package:salute/view/screens/faq_screen/policy_screen.dart';
import 'package:salute/view/screens/faq_screen/terms_of_use_screen.dart';
import 'package:salute/view/screens/home_screens/favorites_screen.dart';
import 'package:salute/view/screens/profile_screens/account_info_screen.dart';
import 'package:salute/view/screens/profile_screens/add_address_screen.dart';
import 'package:salute/view/screens/profile_screens/change_email.dart';
import 'package:salute/view/screens/profile_screens/change_password.dart';
import 'package:salute/view/screens/profile_screens/addresses_screen.dart';
import 'package:salute/view/screens/profile_screens/notifications_screen.dart';
import 'package:salute/view/screens/profile_screens/settings_screen.dart';
import 'package:salute/view/screens/registration_screens/facing_problem_screen.dart';
import 'package:salute/view/screens/registration_screens/allow_location_screen.dart';
import 'package:salute/view/screens/registration_screens/check_email.dart';
import 'package:salute/view/screens/registration_screens/enter_code_screen.dart';
import 'package:salute/view/screens/registration_screens/forget_password.dart';
import 'package:salute/view/screens/registration_screens/help_tkafol_screen.dart';
import 'package:salute/view/screens/registration_screens/order_anywhere_screen.dart';
import 'package:salute/view/screens/registration_screens/sign_in_screen.dart';
import 'package:salute/view/screens/registration_screens/signup_screen.dart';
import 'package:salute/view/screens/registration_screens/welcome_screen.dart';
import 'package:salute/view/screens/registration_screens/wohoo_screen.dart';
import 'package:salute/view/screens/home_screens/cart_screen.dart';
import 'package:salute/view/screens/home_screens/catering_screen.dart';
import 'package:salute/view/screens/home_screens/home_screen.dart';
import 'package:salute/view/screens/home_screens/profile_screen.dart';
import 'package:salute/view/screens/shopping_screens/bon_appetit_screen.dart';
import 'package:salute/view/screens/shopping_screens/cancel_order_screen.dart';
import 'package:salute/view/screens/shopping_screens/catering_product_screen.dart';
import 'package:salute/view/screens/shopping_screens/checkout_screen.dart';
import 'package:salute/view/screens/shopping_screens/order_details_screen.dart';
import 'package:salute/view/screens/shopping_screens/order_history_screen.dart';
import 'package:salute/view/screens/shopping_screens/product_screen.dart';
import 'package:salute/view/screens/shopping_screens/track_order_screen.dart';

import 'data/providers/auth_provider.dart';
import 'view/components/global_drawer.dart';
import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final String authToken = await SharedPreferencesHelper.getSavedUser();
  log(authToken);
  runApp(
    MyApp(
      authtoken: authToken,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    this.authtoken,
  });
  final String? authtoken;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CurrentItemProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ShoppingProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AddressesProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NotificationProvider(),
        )
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
          WelcomeScreen.routeName: (context) => const WelcomeScreen(),
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
          SignUpScreen.routeName: (context) => const SignUpScreen(),
          AllowLocationScreen.routeName: (context) =>
              const AllowLocationScreen(),
          OrderAnywhereScreen.routeName: (context) =>
              const OrderAnywhereScreen(),
          HelpWithTkafolScreen.routeName: (context) =>
              const HelpWithTkafolScreen(),
          FacingProblemScreen.routeName: (context) =>
              const FacingProblemScreen(),
          WohooScreen.routeName: (context) => const WohooScreen(),
          MyHomePage.routeName: (context) => MyHomePage(
                authToken: authtoken!,
              ),
          CateringProductScreen.routeName: (context) =>
              const CateringProductScreen(),
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
          AddressesScreen.routeName: (context) => const AddressesScreen(),
          AddAddressScreen.routeName: (context) => const AddAddressScreen(),
          ProductDetailsScreen.routeName: (context) =>
              const ProductDetailsScreen(),
          CheckoutScreen.routeName: (context) => const CheckoutScreen(),
          TrackOrderScreen.routeName: (context) => const TrackOrderScreen(),
          OrderDetailsScreen.routeName: (context) => const OrderDetailsScreen(),
          BonAppetitScreen.routeName: (context) => const BonAppetitScreen(),
          CancelOrderScreen.routeName: (context) => const CancelOrderScreen(),
          OrderHistoryScreen.routeName: (context) => const OrderHistoryScreen(),
          NotifictaionScreen.routeName: (context) => const NotifictaionScreen(),
        },
        home: authtoken != ""
            ? MyHomePage(
                authToken: authtoken!,
              )
            : const WelcomeScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.authToken});
  static const String routeName = "HomePage";
  final String? authToken;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int lastIndex = 0;
  final List<Widget> pages = [
    const HomeScreen(),
    const FavoritesScreen(),
    const CateringScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  void setPage(int index) {
    Provider.of<ShoppingProvider>(context, listen: false).setCurrentIndex =
        index;
  }

  bool isFirst = true;
  @override
  Widget build(BuildContext context) {
    if (isFirst) {
      Provider.of<AuthProvider>(context, listen: false).setAuthToken =
          widget.authToken!;
      isFirst = false;
    }
    int currentIndex = Provider.of<ShoppingProvider>(context).currentIndex;
    return WillPopScope(
      onWillPop: () async {
        if (Provider.of<ShoppingProvider>(context, listen: false)
            .isTrackingOrder) {
          Navigator.pushNamed(context, TrackOrderScreen.routeName);
          return false;
        } else if (currentIndex != 0) {
          setPage(0);
          return false;
        } else if (currentIndex == 5) {
          setPage(lastIndex);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar:
            Provider.of<ShoppingProvider>(context).currentIndex == 3 ||
                Provider.of<ShoppingProvider>(context).currentIndex == 1,
        drawer: Provider.of<ShoppingProvider>(context).currentIndex == 3 ||
                Provider.of<ShoppingProvider>(context).currentIndex == 1
            ? null
            : GlobalDrawer(
                inviteOnTap: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text(
                        "Invite your friends and family",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      content: Wrap(
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Copy link",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await Clipboard.setData(
                                    const ClipboardData(text: ""),
                                  ).then(
                                    (_) {
                                      Fluttertoast.showToast(
                                          msg: "link was copied successfully",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    },
                                  );
                                },
                                child: const DefaultFormField(
                                  keyboardType: TextInputType.none,
                                  enabled: false,
                                  borderRadius: 12,
                                  suffixIcon: Icon(Icons.copy),
                                ),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              const ShareViaSocialMedia(),
                              const SizedBox(
                                height: 32,
                              ),
                              DefaultButton(
                                margin: 16,
                                text: "Close",
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                tkafolOnTap: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) => const TkafolComponent(),
                  );
                },
                favoritesOnTap: () {
                  Navigator.pop(context);
                  setPage(1);
                },
              ),
        appBar: Provider.of<ShoppingProvider>(context).currentIndex == 1
            ? AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
              )
            : Provider.of<ShoppingProvider>(context).currentIndex == 3
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
                        onPressed: () {
                          Navigator.pushNamed(
                              context, NotifictaionScreen.routeName);
                        },
                        icon: const Icon(
                          Icons.notifications,
                          size: 28,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        iconSize: 28,
                        icon: Image.asset(
                          'assets/images/contact_us_white.png',
                        ),
                      ),
                    ],
                  ),
        //extendBody: true,
        body: pages[Provider.of<ShoppingProvider>(context).currentIndex],
        floatingActionButton: MediaQuery.of(context).viewInsets.bottom != 0.0 ||
                Provider.of<ShoppingProvider>(context).currentIndex == 3
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
        bottomNavigationBar: Provider.of<ShoppingProvider>(context)
                    .currentIndex ==
                3
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
                      iconSize:
                          Provider.of<ShoppingProvider>(context).currentIndex ==
                                  0
                              ? 43
                              : 40,
                      onPressed: () {
                        setPage(0);
                      },
                      icon: Image.asset(
                        Provider.of<ShoppingProvider>(context).currentIndex == 0
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
                      iconSize:
                          Provider.of<ShoppingProvider>(context).currentIndex ==
                                  1
                              ? 45
                              : 41,
                      icon: Image.asset(
                        Provider.of<ShoppingProvider>(context).currentIndex == 1
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
                      iconSize:
                          Provider.of<ShoppingProvider>(context).currentIndex ==
                                  3
                              ? 43
                              : 40,
                      icon: Image.asset(
                        Provider.of<ProductsProvider>(context).cartItems.isEmpty
                            ? 'assets/images/cart_empty_unfocused.png'
                            : 'assets/images/cart_unfocused.png',
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setPage(4);
                      },
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 8),
                      iconSize:
                          Provider.of<ShoppingProvider>(context).currentIndex ==
                                  4
                              ? 43
                              : 40,
                      icon: Image.asset(
                        Provider.of<ShoppingProvider>(context).currentIndex == 4
                            ? 'assets/images/profile_focused.png'
                            : 'assets/images/profile_unfocused.png',
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
