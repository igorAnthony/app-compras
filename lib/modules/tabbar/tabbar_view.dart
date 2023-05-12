import 'package:app_compras/global/constant/colors.dart';
import 'package:app_compras/modules/cart/views/cart_history.dart';
import 'package:app_compras/modules/food/views/food_view.dart';
import 'package:app_compras/modules/orders/views/orders_view.dart';
import 'package:app_compras/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';


class TabbarView extends StatefulWidget {
  @override
  _TabbarViewState createState() => _TabbarViewState();
}

class _TabbarViewState extends State<TabbarView> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    FoodView(),
    OrdersView(),
    CartHistory(),
    ProfileView()
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.mainColor,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}