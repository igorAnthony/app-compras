import 'package:app_compras/constants/theme.dart';
import 'package:flutter/material.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 80,
      decoration: BoxDecoration(
        color: AppTheme.colorBlackWithOpacity,
        boxShadow: [
          BoxShadow(
            color: AppTheme.colorBlackWithOpacity,
            spreadRadius: 1,
            blurRadius: 8, 
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.home,
            color: AppTheme.colorOrange,
            size:35,
          ),
          Icon(
            Icons.favorite_outline,
            color: AppTheme.colorWhite,
            size:35,
          ),
          Icon(
            Icons.notifications,
            color: AppTheme.colorWhite,
            size:35,
          ),
          Icon(
            Icons.person,
            color: AppTheme.colorWhite,
            size:35,
          ),
        ],
      ),
    );
  }
}