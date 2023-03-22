import 'package:app_compras/constants/theme.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 15),
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Icon(
                          Icons.sort_rounded, 
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Icon(
                          Icons.shopping_cart, 
                          color: Colors.white,
                          size: 35,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text("It's a Great Day for Coffee", 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:Color.fromARGB(255, 50, 54, 60),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Find your coffee",
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.5)
                      ),
                      prefixIcon: Icon(
                        Icons.search, 
                        size:30, 
                        color:Colors.white.withOpacity(0.5)
                      ),
                    ),
                  ),
                ),
                TabBar(
                  labelStyle: TextStyle(fontSize: 20.0),
                  labelPadding: EdgeInsets.symmetric(horizontal: 20),
                  isScrollable: true,
                  unselectedLabelColor: Colors.white.withOpacity(0.5),
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 3,
                      color: Color(0xFFE57734),
                    ),
                    insets: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  indicatorColor: Colors.transparent,
                  controller: _tabController,
                  tabs: [
                    Tab(text: "Hot Coffee",),
                    Tab(text: "Hot Coffee",),
                    Tab(text: "Hot Coffee",),
                    Tab(text: "Hot Coffee",),
                  ],
                ),
                SizedBox(height: 10,),
                Center(
                  child: [
                    Container(
                      color:Colors.red,
                    ),
                    Container(
                      color:Colors.red,
                    ),
                    Container(
                      color:Colors.red,
                    ),
                    Container(
                      color:Colors.red,
                    ),
                  ][_tabController.index],
                )
              ],
            ),
          )
      ),
    );
  }
}
