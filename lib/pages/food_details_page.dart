import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/ui_models/food_details_args.dart';
import 'package:food_delivery/widgtes/custom_back_buttom.dart';
import 'package:food_delivery/widgtes/favorite_buttom.dart';
import 'package:food_delivery/widgtes/food_details/food_item_counter.dart';
import 'package:food_delivery/widgtes/food_details/property_item.dart';

class FoodDetailsPage extends StatelessWidget {
  final int foodIndex;
  const FoodDetailsPage({super.key, required this.foodIndex});

  static const routeName = '/food-details';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final FoodDetailsArgs foodArgs =
        ModalRoute.of(context)!.settings.arguments as FoodDetailsArgs;
    final foodIndex = foodArgs.foodIndex;

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomBackButtom(
                        onTap:
                            () => Navigator.of(
                              context,
                            ).pop<String>(food[foodIndex].name),
                        height: size.height * 0.09,
                        width: size.width * 0.05,
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FavoriteButtom(
                          foodIndex: foodIndex,
                          height: size.height * 0.1,
                          width: size.width * 0.09,
                        ),
                      ),
                    ],
                    expandedHeight: size.height * 0.33,
                    // pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.grey[300]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Image.asset(
                              food[foodIndex].imageURL,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 16.0,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  food[foodIndex].name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 6.0),
                                Text(
                                  'SKY FOOD',
                                  style: Theme.of(context).textTheme.bodyLarge!
                                      .copyWith(color: Colors.grey[900]),
                                ),
                              ],
                            ),
                            const FoodItemCounter(),
                          ],
                        ),
                        const SizedBox(height: 32.0),
                        const IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PropertyItem(
                                propertyName: 'Size',
                                propertyValue: 'Medium',
                              ),
                              VerticalDivider(indent: 0, endIndent: 0),
                              PropertyItem(
                                propertyName: 'Calories',
                                propertyValue: '150 Kcal',
                              ),
                              VerticalDivider(indent: 0, endIndent: 0),
                              PropertyItem(
                                propertyName: 'Cooking',
                                propertyValue: '10-20 Min',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum  Ipsum Lorem Ipsum  Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem IpsumLorem Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum  Lorem Ipsum',
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(color: Colors.grey[900]),
                        ),
                        const SizedBox(height: 32.0),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${food[foodIndex].price} MRU',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: size.height * 0.05,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Checkout',
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge!.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
