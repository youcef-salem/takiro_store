import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:takiro_store/view/Home.dart';
import 'package:takiro_store/view/auth.dart';

class BottomNavbar extends StatefulWidget {
   BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
final PersistentTabController _controller = PersistentTabController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body :PersistentTabView(


     tabs: [
       
    PersistentTabConfig(
    screen: Home(),
    item: ItemConfig(
    icon: Icon(Icons.home),
    title: "Home",
    ),
    ),
    PersistentTabConfig(
    screen: Container(),
    item: ItemConfig(


    icon: Icon(Icons.shopping_bag),
    title: "Shop",

    ),
    ),
       PersistentTabConfig(
         screen: Auth(),
         item: ItemConfig(


           icon: Icon(Icons.credit_card),
           title: "Card",

         ),
       ),
       PersistentTabConfig(
         screen: Container(),
         item: ItemConfig(


           icon: Icon(Icons.favorite_border),
           title: "Favorite",

         ),
       ),
       PersistentTabConfig(
         screen: Auth(),
         item: ItemConfig(


           icon: Icon(Icons.account_circle_outlined),
           title: "Profile",

         ),
       ),

     ],
    navBarBuilder: (navBarConfig) => Style1BottomNavBar(
    navBarConfig: navBarConfig,
      navBarDecoration: NavBarDecoration(


      ),
    ),
     )
    );
  }
}