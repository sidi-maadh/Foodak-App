import 'package:food_delivery/utilities/app_assets.dart';

class CategoriesItem {
  final String id;
  final String title;
  final String imgPath;

  CategoriesItem({
    required this.id,
    required this.title,
    required this.imgPath,
  });
}

final List<CategoriesItem> categories = [
  CategoriesItem(id: '1', title: 'Burger', imgPath: AppAssets.burgerIcon),
  CategoriesItem(id: '2', title: 'Pizza', imgPath: AppAssets.pizzaIcon),
  CategoriesItem(id: '3', title: 'Pasta', imgPath: AppAssets.pastaIcon),
  CategoriesItem(id: '4', title: 'Pasta', imgPath: AppAssets.pastaIcon),
  CategoriesItem(id: '5', title: 'Pasta', imgPath: AppAssets.pastaIcon),
  CategoriesItem(id: '6', title: 'Pasta', imgPath: AppAssets.pastaIcon)
];
