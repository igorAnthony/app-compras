import 'package:app_compras/constants/theme.dart';
import 'package:app_compras/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding:EdgeInsets.only(top:100, bottom:40),
        decoration: BoxDecoration(
          color: AppTheme.colorBlack,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Coffe Shop",
              style: GoogleFonts.pacifico(
                fontSize: 50, 
                color: AppTheme.colorWhite,
              ),
            ),
            Column(
              children: [
                Text("Feeling Low? Take a Sip of Coffee",
                  style: TextStyle(
                    color:Colors.white.withOpacity(0.8),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 80),
                Material(
                  color: AppTheme.colorOrange,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeView()),
                      );
                    },
                    borderRadius: BorderRadius.circular(10),
                    splashFactory: InkRipple.splashFactory,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                      child: Text("Get Start",
                        style : TextStyle(
                          color: AppTheme.colorWhite,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}