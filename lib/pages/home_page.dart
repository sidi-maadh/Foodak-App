// Dart
// import 'dart:io';

// Flutter
import 'package:flutter/material.dart';
import 'package:food_delivery/models/categories_item.dart';

// Other Package

// Internal (File)
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/pages/food_details_page.dart';
import 'package:food_delivery/ui_models/food_details_args.dart';
import 'package:food_delivery/utilities/app_assets.dart';
import 'package:food_delivery/widgtes/food_grid_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? categorieChosenId;
  late List<FoodItem> filteredFood;
  bool enableCategoryFilter = false;

  @override
  void initState() {
    super.initState();
    filteredFood = food;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                AppAssets.burgerBanner,
                height: isLandscape ? size.height * 0.7 : size.height * 0.23,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: size.height * 0.04),
            SizedBox(
              height: size.height * 0.124,
              child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder:
                    (context, index) => Padding(
                      padding: const EdgeInsetsDirectional.only(end: 16.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (categorieChosenId == categories[index].id || !enableCategoryFilter){
                              enableCategoryFilter = !enableCategoryFilter;
                            }
                            if (enableCategoryFilter) {
                              categorieChosenId = categories[index].id;
                              filteredFood =
                                  food
                                      .where(
                                        (item) =>
                                            item.categoriesId ==
                                            categorieChosenId,
                                      )
                                      .toList();
                            } else {
                              filteredFood = food;
                              categorieChosenId = null;
                            }
                          });
                        },
                        child: Container(
                          width: size.width * 0.2,
                          decoration: BoxDecoration(
                            color:
                                categorieChosenId == categories[index].id
                                    ? Colors.deepOrange
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Image.asset(categories[index].imgPath),
                                const SizedBox(height: 8.0),
                                Text(
                                  categories[index].title,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleSmall!.copyWith(
                                    color:
                                        categorieChosenId ==
                                                categories[index].id
                                            ? Colors.white
                                            : null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
              ),
            ),
            SizedBox(height: size.height * 0.04),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: filteredFood.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isLandscape ? 4 : 2,
                mainAxisSpacing: size.height * 0.02,
                crossAxisSpacing: size.height * 0.02,
              ),
              itemBuilder:
                  (context, index) => InkWell(
                    onTap: () {
                      final targetedFoodIndex = food.firstWhere(
                        (item) => item.id == filteredFood[index].id,
                      );
                      final targetedIndex = food.indexOf(targetedFoodIndex);
                      Navigator.of(context)
                          .pushNamed(
                            FoodDetailsPage.routeName,
                            arguments: FoodDetailsArgs(
                              foodIndex: targetedIndex,
                            ),
                          )
                          .then((onValue) {
                            setState(() {});
                            filteredFood = food;
                            categorieChosenId = null;
                            debugPrint('The Value Returned in Home: $onValue');
                          });
                    },
                    child: FoodGridItem(
                      foodIndex: index,
                      filteredFoot: filteredFood,
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
