import 'package:eisteintaste/global/constant/dimensions.dart';
import 'package:eisteintaste/global/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(Dimensions.width20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bigText('Search', size: Dimensions.font26, weight: FontWeight.bold),
              SizedBox(height: Dimensions.height20),
              Container(
                width: double.maxFinite,
                height: Dimensions.height45,
                child: Row(
                  children: [
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.width15),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 0.5,
                            blurRadius: 4,
                          )
                        ]
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          prefixIcon: Icon(Icons.search, color: Colors.grey[500],),
                          contentPadding: EdgeInsets.only(left: Dimensions.width20, top: Dimensions.height10)
                        ),
                      ),
                    ),
                    SizedBox(width: Dimensions.width10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.width15),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 0.5,
                            blurRadius: 4,
                          )
                        ]
                      ),
                      child: Icon(Icons.filter_list, color: Colors.grey[500],),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}