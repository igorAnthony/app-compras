import 'package:app_compras/constants/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemsWidget extends StatefulWidget {

  ItemsWidget({super.key});

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  List img = ['Latte', 'Espresso', 'Black Coffee', 'Cold Coffee'];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: (150/215),
      children: [
        for(int i = 0; i < img.length; i++)
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFF212325),
            boxShadow: [
              BoxShadow(
                color: AppTheme.colorBlackWithOpacity,
                spreadRadius: 1,
                blurRadius: 8,
              ),
            ]
          ),
          child: Column(
            children: [
              InkWell(
                onTap:() {
                  
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Image.asset(
                    "images/${img[i]}.png",
                    width: 120,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                  
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8, left:5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        img[i],
                        style: TextStyle(
                          fontSize:18,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.colorWhite,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                       "Best Coffee",
                        style: TextStyle(
                          fontSize:16,
                          color: Colors.white60,
                        ),
                      )
                    ],
                  )
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical:5, horizontal: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$30",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.colorWhite,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppTheme.colorOrange,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Icon(
                        CupertinoIcons.add,
                        size: 20,
                        color: AppTheme.colorWhite,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
        
      ],
    );
  }
}