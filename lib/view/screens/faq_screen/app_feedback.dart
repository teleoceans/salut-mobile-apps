import 'package:flutter/material.dart';
import 'package:salute/view/components/default_button.dart';
import 'package:salute/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppFeedbackScreen extends StatelessWidget {
  const AppFeedbackScreen({super.key});
  static const String routeName = "AppFeedbackScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${AppLocalizations.of(context)!.feedback}',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: kArrowBack(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - kToolbarHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    '${AppLocalizations.of(context)!.feedback_mass}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 32.0,
                      left: (MediaQuery.of(context).size.width - 314) / 2,
                      right: (MediaQuery.of(context).size.width - 314) / 2,
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.star_border,
                          size: 50,
                          color: Color(0xFFFFD600),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.star_border,
                          size: 50,
                          color: Color(0xFFFFD600),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.star_border,
                          size: 50,
                          color: Color(0xFFFFD600),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.star_border,
                          size: 50,
                          color: Color(0xFFFFD600),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.star_border,
                          size: 50,
                          color: Color(0xFFFFD600),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      left: (MediaQuery.of(context).size.width - 310) / 2,
                      right: (MediaQuery.of(context).size.width - 310) / 2,
                      bottom: 43,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:   [
                        Text(
                           '${AppLocalizations.of(context)!.poor}',
                          style:
                              TextStyle(color: Color.fromARGB(255, 78, 78, 78)),
                        ),
                        Text(
                          '${AppLocalizations.of(context)!.excellent}',
                          style:
                              TextStyle(color: Color.fromARGB(255, 78, 78, 78)),
                        ),
                      ],
                    ),
                  ),
                    Text(
                     '${AppLocalizations.of(context)!.comment}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                    Text(
                      '${AppLocalizations.of(context)!.feedback_mass2}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      height: 1.3,
                    ),
                  ),
                  TextFormField(
                    decoration:  InputDecoration(
                      hintText: '${AppLocalizations.of(context)!.type_here}',
                      // alignLabelWithHint: true,
                      labelStyle: TextStyle(color: Colors.black),
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DefaultButton(
                    margin: 70,
                    text: '${AppLocalizations.of(context)!.feedback_send}',
                    onTap: () {},
                  ),
                  const Spacer(),
                    Text(
                      '${AppLocalizations.of(context)!.help}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                    Text(
                      '${AppLocalizations.of(context)!.help_mass}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  DefaultButton(
                    borderColor: kPrimaryColor,
                    backgroundColor: Colors.transparent,
                    margin: 70,
                    fontWeight: FontWeight.normal,
                    textColor: Colors.black,
                    text: '${AppLocalizations.of(context)!.help_get}',
                    onTap: () {},
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
