import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salute/constants.dart';
import 'package:salute/view/screens/faq_screen/app_feedback.dart';
import 'package:salute/view/screens/faq_screen/faq.dart';
import 'package:salute/view/screens/faq_screen/policy_screen.dart';
import 'package:salute/view/screens/faq_screen/terms_of_use_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});
  static const String routeName = "AboutUsScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   Text(
          '${AppLocalizations.of(context)!.aboutUs}',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: kArrowBack(context),
      ),
      body: SafeArea(
        child: Column(
          children: [
             AboutUsListTile(
              title: '${AppLocalizations.of(context)!.faq}',
              nextRoute: FaqScreen.routeName,
            ),
             AboutUsListTile(
              title: '${AppLocalizations.of(context)!.feedback}',
              nextRoute: AppFeedbackScreen.routeName,
            ),
             AboutUsListTile(
              title: '${AppLocalizations.of(context)!.terms}',
              nextRoute: TermsOfUseScreen.routeName,
            ),
             AboutUsListTile(
              title: '${AppLocalizations.of(context)!.policy}',
              nextRoute: PolicyScreen.routeName,
            ),
            const Spacer(),
             Text('${AppLocalizations.of(context)!.find_us}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            const FindUsSocailMedia(),
            const Spacer(),
            Image.asset(
              'assets/images/salut_text_ black.png',
              width: 80,
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "version 1.0.0",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FindUsSocailMedia extends StatelessWidget {
  const FindUsSocailMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(10),
          child: GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(13),
              width: 68,
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                FontAwesomeIcons.facebook,
                color: Colors.blue,
                size: 35,
              ),
            ),
            onTap: (){
              LaunchUrl("https://www.facebook.com/profile.php?id=100089473891428");
            },
          ),
        ),
        Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(10),
          child: GestureDetector(
            child: Container(
              width: 68,
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                FontAwesomeIcons.instagram,
                color: Colors.orange,
                size: 35,
              ),
            ),
            onTap: (){
              LaunchUrl("https://www.instagram.com/salutkitchen1/");
            },
          ),
        ),
      ],
    );
  }
}

class AboutUsListTile extends StatelessWidget {
  const AboutUsListTile({
    super.key,
    required this.title,
    required this.nextRoute,
  });
  final String title;
  final String nextRoute;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, nextRoute);
      },
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward,
        color: kPrimaryColor,
      ),
    );
  }
}
