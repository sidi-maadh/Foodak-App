import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widgtes/favorite_buttom.dart';

class FoodGridItem extends StatelessWidget {
  final int foodIndex;
  final List<FoodItem> filteredFoot;
  const FoodGridItem({super.key, required this.foodIndex, required this.filteredFoot});

  @override
  Widget build(BuildContext context) {
    final targetedIndex = food.indexOf(filteredFoot[foodIndex]);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: LayoutBuilder(
          builder:
              (context, constraints) => Column(
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Image.asset(
                        filteredFoot[foodIndex].imageURL,
                        height: constraints.maxHeight * 0.5,
                        // fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: FavoriteButtom(
                          foodIndex: targetedIndex,
                          height: constraints.maxHeight * 0.2,
                          width: constraints.minWidth * 0.2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  SizedBox(
                    height: constraints.maxHeight * 0.17,
                    child: FittedBox(
                      child: Text(
                        filteredFoot[foodIndex].name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  SizedBox(
                    height: constraints.maxHeight * 0.16,
                    child: FittedBox(
                      child: Text(
                        '${filteredFoot[foodIndex].price} MRU',
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
