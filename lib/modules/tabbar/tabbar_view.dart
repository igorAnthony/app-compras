import 'package:eisteintaste/global/constant/api_constant.dart';
import 'package:eisteintaste/global/constant/colors.dart';
import 'package:eisteintaste/modules/admin/views/admin_view.dart';
import 'package:eisteintaste/modules/cart/views/cart_history.dart';
import 'package:eisteintaste/modules/food/views/food_view.dart';
import 'package:eisteintaste/modules/orders/views/orders_view.dart';
import 'package:eisteintaste/modules/profile/views/profile_view.dart';
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
    CartHistoryView(),
    ProfileView(),
    AdminPanelView(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  


  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> bottomNavBarItems = [
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
    ];
    if(box.read('admin') == 1){
        bottomNavBarItems.add(
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            label: 'Admin',
          ),
      );
    }
    

    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.mainColor,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        items: bottomNavBarItems,
      ),
    );
  }
}