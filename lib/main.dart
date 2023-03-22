import 'package:app_compras/constants/routes.dart';
import 'package:app_compras/constants/theme.dart';
import 'package:app_compras/views/home_screen.dart';
import 'package:app_compras/views/welcome_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppTheme.backgroundColor,
      ),
      home: const WelcomePage(),
      routes: {
        homeRoute: (context) => const HomeView(),
      },
    ));
}


