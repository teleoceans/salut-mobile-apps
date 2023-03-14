import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';
import 'package:salute/data/models/category.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key, required this.categories});
  final List<Category> categories;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent,
              backgroundImage: AdvancedNetworkImage(
                categories[index].imageUrl,
                timeoutDuration: const Duration(seconds: 3),
                retryLimit: 2,
                fallbackAssetImage: 'assets/images/pizza.png',
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            categories[index].title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
