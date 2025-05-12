import 'package:flutter/material.dart';
import 'package:food_delivery/pages/bottom_navbar_page.dart';
import 'package:food_delivery/pages/food_details_page.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  //   DeviceOrientation.landscapeLeft,
  //   DeviceOrientation.landscapeRight
  // ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodak - Food Delivery',
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.grey[300],
        // useMaterial3: true,
        // colorSchemeSeed: Colors.deepOrange,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[300],
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        dividerTheme: DividerThemeData(
          thickness: 2, 
          indent: 20, 
          endIndent: 20
        ),
        listTileTheme: ListTileThemeData(),
        textTheme: TextTheme(),
        fontFamily: 'OpenSans',
      ),
      // home: const BottomNavBarPage(),
      routes: {
        '/': (context) => const BottomNavBarPage(),
        FoodDetailsPage.routeName: (context) => FoodDetailsPage(foodIndex: 1)
      },
    );
  }
}
