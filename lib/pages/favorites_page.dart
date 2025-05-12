import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/pages/food_details_page.dart';
import 'package:food_delivery/ui_models/food_details_args.dart';
import 'package:food_delivery/utilities/app_assets.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  Widget emptyFavState(bool isLandscape, Size size) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            AppAssets.emptyState,
            height: isLandscape ? size.height * 0.5 : size.height * 0.3,
            fit: BoxFit.cover,
          ),
          Text(
            'No Favorite items Founds!',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final favoriteFood =
        food.where((foodItem) => foodItem.isFavorite == true).toList();

    if (favoriteFood.isEmpty) {
      return emptyFavState(isLandscape, size);
    }

    return ListView.builder(
      itemCount: favoriteFood.length,
      itemBuilder:
          (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () {
                int targetedIndex = food.indexOf(favoriteFood[index]);
                Navigator.of(context)
                  .pushNamed(
                    FoodDetailsPage.routeName, 
                    arguments: FoodDetailsArgs(foodIndex: targetedIndex)
                  ).then(
                    (onValue) => setState(() {
                      debugPrint('The Value Returned in Favorite: $onValue');
                    }),
                  );
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset(
                        favoriteFood[index].imageURL,
                        height:
                            isLandscape
                                ? size.height * 0.2
                                : size.height * 0.08,
                        width: size.width * 0.2,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              favoriteFood[index].name,
                              style:
                                  isLandscape
                                      ? Theme.of(
                                        context,
                                      ).textTheme.headlineSmall
                                      : Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              '${favoriteFood[0].price} MRU',
                              style: Theme.of(
                                context,
                              ).textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          final targetIten = favoriteFood[index];
                          int targetIndex = food.indexOf(targetIten);
                          setState(() {
                            food[targetIndex] = food[targetIndex].copyWith(
                              isFavorite: false,
                            );
                            favoriteFood.remove(targetIten);
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: Theme.of(context).primaryColor,
                          size:
                              isLandscape
                                  ? size.height * 0.1
                                  : size.height * 0.035,
                        ),
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
