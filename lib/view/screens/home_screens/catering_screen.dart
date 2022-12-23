import 'package:flutter/material.dart';
import 'package:salute/view/components/shopping_components/catering_tab_view.dart';
import 'package:salute/data/models/catering_category.dart';

import '../../components/default_form_field.dart';
import '../../../constants.dart';

class CateringScreen extends StatelessWidget {
  const CateringScreen({super.key});
  static const String routeName = "CateringScreen";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 60,
        ),
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
            children: const [
              Icon(
                Icons.location_on,
                color: kPrimaryColor,
              ),
              Text(
                "  Deliver to ",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                " 123,ABC, Address address ",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: DefaultTabController(
            length: 3,
            initialIndex: 0,
            child: Column(
              children: [
                const TabBar(
                  indicatorColor: kPrimaryColor,
                  labelColor: kPrimaryColor,
                  unselectedLabelColor: Colors.black,
                  labelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  tabs: [
                    Tab(
                      text: "Mashy",
                    ),
                    Tab(
                      text: "Hamam",
                    ),
                    Tab(
                      text: "Food",
                    ),
                  ],
                ),
                MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: Expanded(
                    child: TabBarView(
                      children: [
                        CateringTabView(
                          cateringProduct: CateringProduct(
                            index: 0,
                            title: 'Mashy',
                            price: 150,
                            imageUrl: 'assets/images/product_detail_screen.png',
                            ingredients:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Purus aenean amet massa sed at iaculis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Purus aenean amet massa sed at iaculis.",
                          ),
                        ),
                        CateringTabView(
                          cateringProduct: CateringProduct(
                            index: 0,
                            title: 'Hamam',
                            price: 150,
                            imageUrl: 'assets/images/product_detail_screen.png',
                            ingredients:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Purus aenean amet massa sed at iaculis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Purus aenean amet massa sed at iaculis.",
                          ),
                        ),
                        CateringTabView(
                          cateringProduct: CateringProduct(
                            index: 0,
                            title: 'Food',
                            price: 150,
                            imageUrl: 'assets/images/product_detail_screen.png',
                            ingredients:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Purus aenean amet massa sed at iaculis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Purus aenean amet massa sed at iaculis.",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
