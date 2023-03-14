import 'package:flutter/material.dart';
import 'package:salute/data/models/food_promotion.dart';

class FoodPromotionListView extends StatelessWidget {
  const FoodPromotionListView({super.key, required this.foodPromotions});
  final List<FoodPromotion> foodPromotions;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(12),
        width: 280,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(foodPromotions[index].imageUrl),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "${foodPromotions[index].percentage} OFF",
              style: const TextStyle(
                fontSize: 32,
                shadows: [
                  Shadow(
                    offset: Offset(2, 2),
                    color: Colors.black,
                    blurRadius: 4.0,
                  ),
                ],
              ),
            ),
            Text(
              "${foodPromotions[index].onWhichCategory} OFF",
              style: const TextStyle(
                fontSize: 16,
                shadows: [
                  Shadow(
                    offset: Offset(2, 2),
                    color: Colors.black,
                    blurRadius: 4.0,
                  ),
                ],
              ),
            ),
            Container(
              width: 170,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black, width: 0.8),
              ),
              child: Center(
                child: Text(
                  "use code ${foodPromotions[index].code}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
