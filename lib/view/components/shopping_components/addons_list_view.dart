import 'package:flutter/material.dart';
import 'package:salute/view/components/shopping_components/extra_check_box.dart';

class AddonsListView extends StatelessWidget {
  const AddonsListView({super.key, required this.items, required this.isAddon});
  final List items;
  final bool isAddon;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => ExtrasCheckBox(
        isAddon: isAddon,
        item: items[index],
      ),
      itemCount: items.length,
    );
  }
}
