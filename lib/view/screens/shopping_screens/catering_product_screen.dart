import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/data/providers/products_provider.dart';
import 'package:salute/view/components/shopping_components/catering_tab_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../data/providers/addresses_provider.dart';
import '../../components/default_form_field.dart';
import '../../../constants.dart';
import '../profile_screens/addresses_screen.dart';

class CateringProductScreen extends StatefulWidget {
  const CateringProductScreen({super.key});
  static const String routeName = "CateringProductScreen";

  @override
  State<CateringProductScreen> createState() => _CateringProductScreenState();
}

class _CateringProductScreenState extends State<CateringProductScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(16),
                      child: DefaultFormField(
                        borderRadius: 16,
                        hintText: "${AppLocalizations.of(context)!.search}",
                        unFocusColor: Colors.transparent,
                        focusColor: Colors.black.withOpacity(0.2),
                        textColor: Colors.black,
                        keyboardType: TextInputType.text,
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 28,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: kPrimaryColor,
                    size: 28,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/support_icon.png"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: kPrimaryColor,
                  ),
                    Text(
                    "${AppLocalizations.of(context)!.deliver}",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AddressesScreen.routeName);
                    },
                    child: Text(
                      Provider.of<AddressesProvider>(context).currentAddress ==
                              null
                          ? "${AppLocalizations.of(context)!.add_addresses}"
                          : "${Provider.of<AddressesProvider>(context).currentAddress!.buildNumber}, ${Provider.of<AddressesProvider>(context).currentAddress!.streetName}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: Provider.of<ProductsProvider>(context, listen: false)
                    .cateringProduct
                    .length,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
                        indicatorColor: kPrimaryColor,
                        labelColor: kPrimaryColor,
                        unselectedLabelColor: Colors.black,
                        labelStyle: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                        tabs: tabs),
                    MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: Expanded(
                        child: TabBarView(children: tabViews),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> get tabs => List.generate(
        Provider.of<ProductsProvider>(context, listen: false)
            .cateringProduct
            .length,
        (index) => Tab(
          text: Provider.of<ProductsProvider>(context, listen: false)
              .cateringProduct[index]
              .title,
        ),
      );
  List<Widget> get tabViews => List.generate(
        Provider.of<ProductsProvider>(context, listen: false)
            .cateringProduct
            .length,
        (index) => CateringTabView(
          cateringProduct: Provider.of<ProductsProvider>(context, listen: false)
              .cateringProduct[index],
        ),
      );
}
