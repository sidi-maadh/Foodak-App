class FoodItem {
  final String name;
  final String imageURL;
  final double price;

  FoodItem({
    required this.name, 
    required this.imageURL, 
    required this.price
  });
}

List<FoodItem> food = [

  FoodItem(
    name: 'Beef Burger', 
    imageURL: 'https://www.freepnglogos.com/uploads/burger-png/download-hamburger-burger-png-image-png-image-pngimg-15.png', 
    price: 8.99
  ),
  FoodItem(
    name: 'Chicken Burger', 
    imageURL: 'https://www.pngarts.com/files/3/Chicken-Burger-PNG-Photo.png', 
    price: 8.99
  ),
  FoodItem(
    name: 'Chesse Burger', 
    imageURL: 'https://www.pngarts.com/files/3/Chicken-Burger-PNG-Photo.png', 
    price: 10.99
  ),
  FoodItem(
    name: 'Chicken Pizza', 
    imageURL: 'https://graficsea.com/wp-content/uploads/2021/12/Chicken-Supreme-Pizza-.png', 
    price: 10.99
  ),
  FoodItem(
    name: 'Pasta', 
    imageURL: 'https://www.pngall.com/wp-content/uploads/2018/04/Pasta-PNG-Image.png', 
    price: 10.99
  ),

];