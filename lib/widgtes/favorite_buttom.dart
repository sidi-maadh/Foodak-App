import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widgtes/custom_secondry_buttom.dart';

class FavoriteButtom extends StatefulWidget {
  final int foodIndex;
  final double height;
  final double width;
  FavoriteButtom({
    super.key,
    required this.foodIndex,
    required this.height,
    required this.width,
  }) {
    // debugPrint('Constructors $foodIndex');
  }

  @override
  State<FavoriteButtom> createState() {
    // debugPrint('createState');
    return _FavoriteButtomState();
  }
}

class _FavoriteButtomState extends State<FavoriteButtom>
    with WidgetsBindingObserver {
  // @override
  // void initState() {
  //   super.initState();
  //   debugPrint('initState');
  //   WidgetsBinding.instance.addObserver(this);
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   debugPrint('didchangeDependencies');
  // }

  // @override
  // void didUpdateWidget(covariant FavoriteButtom oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   debugPrint('didUpdateWidget');
  // }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   super.didChangeAppLifecycleState(state);
  //   debugPrint(state.toString());
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   WidgetsBinding.instance.removeObserver(this);
  //   debugPrint('dispose');
  // }

  @override
  Widget build(BuildContext context) {
    // debugPrint('Build Methode');
    return CustomSecondryButtom(
      height: widget.height,
      width: widget.width,
      onTap:() => setState(() {
        food[widget.foodIndex] = food[widget.foodIndex].copyWith(
          isFavorite: !food[widget.foodIndex].isFavorite,
        );
      }),
      iconData:
        food[widget.foodIndex].isFavorite
        ? Icons.favorite
        : Icons.favorite_border,
    );
  }
}
