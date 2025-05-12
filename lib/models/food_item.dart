class FoodItem {
  final String id;
  final String name;
  final String imageURL;
  final double price;
  final bool isFavorite;
  final String categoriesId;

  const FoodItem({
    required this.id,
    required this.name,
    required this.imageURL,
    required this.price,
    this.isFavorite = false,
    required this.categoriesId,
  });

  FoodItem copyWith({
    String? id,
    String? name,
    String? imageURL,
    double? price,
    bool? isFavorite,
    String? categoriesId,
  }) {
    return FoodItem(
      id: id ?? this.id,
      name: name ?? this.name,
      imageURL: imageURL ?? this.imageURL,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
      categoriesId: categoriesId ?? this.categoriesId,
    );
  }
}

List<FoodItem> food = [
  FoodItem(
    id: 'Burger 1',
    name: 'Beef Burger',
    imageURL: 'assets/images/beef_burger.png',
    price: 120,
    categoriesId: '1',
  ),
  FoodItem(
    id: 'Burger 2',
    name: 'Chicken Burger',
    imageURL: 'assets/images/Chicken-Burger.png',
    price: 150,
    categoriesId: '1',
  ),
  FoodItem(
    id: 'Burger 3',
    name: 'Chesse Burger',
    imageURL: 'assets/images/Chicken-Burger.png',
    price: 150,
    categoriesId: '1',
  ),
  FoodItem(
    id: 'Pizza',
    name: 'Chicken Pizza',
    imageURL: 'assets/images/Chicken-Pizza.png',
    price: 150,
    categoriesId: '2',
  ),
  FoodItem(
    id: 'Pasta 1',
    name: 'Pasta',
    imageURL: 'assets/images/Pasta.png',
    price: 200,
    categoriesId: '3',
  ),
  FoodItem(
    id: 'Pasta 2',
    name: 'Pasta2',
    imageURL: 'assets/images/Pasta.png',
    price: 200,
    categoriesId: '4',
  ),
  FoodItem(
    id: 'Pasta 3',
    name: 'Pasta3',
    imageURL: 'assets/images/Pasta.png',
    price: 200,
    categoriesId: '5',
  ),
  FoodItem(
    id: 'Pasta 4',
    name: 'Pasta4',
    imageURL: 'assets/images/Pasta.png',
    price: 200,
    categoriesId: '6',
  ),
];
