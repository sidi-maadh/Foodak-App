import 'package:flutter/material.dart';
import 'package:food_delivery/utilities/app_assets.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  Widget orderVouchersItem(
    BuildContext context, {
    required String name,
    required int number,
  }) {
    return Column(
      children: [
        Text(
          number.toString(),
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: Theme.of(context).primaryColor,
          ),
        ),
        Text(name, style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }

  Widget itemTappedTile(
    BuildContext context, {
    required String title,
    required IconData icon,
    String? subtitle,
  }) {
    return ListTile(
      title: Text(title),
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(icon, size: 30, color: Colors.grey[100]),
      ),
      onTap: () => debugPrint('$title clicked'),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: Icon(
        Icons.chevron_right,
        color: Theme.of(context).primaryColor,
        size: 30,
      ),
    );
  }

  Widget personPhoto(double height, double width) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(AppAssets.profilePhoto),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final test = Text(
      'Sidi Maadh',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
    );

    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (!isLandscape) ...[
              personPhoto(size.height * 0.2, size.width * 0.4),

              // ClipRRect(
              //   borderRadius: BorderRadius.circular(100),
              //   child: Image.asset(
              //     'assets/images/sidi-maadh.jpg',
              //     height: 300,
              //   ),
              // ),
              // const SizedBox(height: 16.0),
              test,
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  orderVouchersItem(context, name: 'Orders', number: 50),
                  orderVouchersItem(context, name: 'Vouchers', number: 10),
                ],
              ),
            ],
            const SizedBox(height: 24),
            if (isLandscape) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      personPhoto(size.height * 0.3, size.width * 0.5),
                      test,
                    ],
                  ),
                  Column(
                    children: [
                      orderVouchersItem(context, name: 'Orders', number: 50),
                      const SizedBox(height: 16),
                      orderVouchersItem(context, name: 'Vouchers', number: 10),
                    ],
                  ),
                ],
              ),
            ],
            const Divider(),
            itemTappedTile(
              context,
              title: 'Past Orders',
              icon: Icons.shopping_cart,
            ),
            const Divider(),
            itemTappedTile(
              context,
              title: 'Available Vouchers',
              icon: Icons.card_giftcard,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
