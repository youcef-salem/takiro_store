import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:provider/provider.dart';
import 'package:takiro_store/controlers/Data_base.dart';
import 'package:takiro_store/view/Home.dart';

import 'package:takiro_store/view/profile_page.dart';
import '../controlers/auth_conteroler.dart';
import '../services/Auth.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    // Create database instance with current user's UUID
    final db = Provider.of<fire_store_db>(context, listen: false);

    return Scaffold(
      body: PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: Home(),
            item: ItemConfig(icon: Icon(Icons.home), title: "Home"),
          ),
          PersistentTabConfig(
            screen: Container(),
            item: ItemConfig(icon: Icon(Icons.shopping_bag), title: "Shop"),
          ),
          PersistentTabConfig(
            screen: Container(),
            item: ItemConfig(icon: Icon(Icons.credit_card), title: "Card"),
          ),
          PersistentTabConfig(
            screen: Container(),
            item: ItemConfig(
              icon: Icon(Icons.favorite_border),
              title: "Favorite",
            ),
          ),
          PersistentTabConfig(
            screen: ChangeNotifierProvider<auth_controler>(
              create: (_) => auth_controler(auth: auth, dba: db),
              child: const ProfilePage(),
            ),
            item: ItemConfig(
              icon: Icon(Icons.account_circle_outlined),
              title: "Profile",
            ),
          ),
        ],
        navBarBuilder:
            (navBarConfig) => Style1BottomNavBar(
              navBarConfig: navBarConfig,
              navBarDecoration: NavBarDecoration(),
            ),
      ),
    );
  }
}
