import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/data/providers/current_product_provider.dart';

class ExtrasCheckBox extends StatefulWidget {
  const ExtrasCheckBox({super.key, required this.item, required this.isAddon});
  final item;
  final bool isAddon;
  @override
  State<ExtrasCheckBox> createState() => _ExtrasCheckBoxState();
}

class _ExtrasCheckBoxState extends State<ExtrasCheckBox> {
  bool currentValue = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              widget.item.name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(widget.item.imageUrl)),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 3,
                  color: Colors.black.withOpacity(0.1),
                )
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Theme(
                data: ThemeData().copyWith(
                  unselectedWidgetColor: Colors.black,
                ),
                child: Checkbox(
                    activeColor: Colors.green,
                    value: currentValue,
                    onChanged: (value) {
                      setState(() {
                        currentValue = value!;
                      });
                      if (widget.isAddon) {
                        Provider.of<CurrentItemProvider>(context, listen: false)
                            .addToAddons(widget.item);
                      } else {
                        Provider.of<CurrentItemProvider>(context, listen: false)
                            .addToSubProducts(widget.item);
                      }
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
