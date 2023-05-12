import 'package:app_compras/global/constant/colors.dart';
import 'package:app_compras/global/constant/route.dart';
import 'package:app_compras/modules/popular/controllers/popular_product_controller.dart';
import 'package:app_compras/modules/recommended/controllers/recommended_controller.dart';
import 'package:app_compras/models/products_model.dart';
import 'package:app_compras/global/widgets/column_details_food.dart';
import 'package:app_compras/global/widgets/text.dart';
import 'package:app_compras/global/constant/dimensions.dart';
import 'package:app_compras/global/widgets/icon_and_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodBodyView extends StatefulWidget {
  const FoodBodyView({super.key});

  @override
  State<FoodBodyView> createState() => _FoodBodyViewState();
}

class _FoodBodyViewState extends State<FoodBodyView> {
  late PageController pageController;
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _heigth = Dimensions.pageViewContainer;
  final PopularController popularController = Get.find<PopularController>();
  final RecommendedController recommendedController = Get.find<RecommendedController>();

  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => popularController.isLoaded.value
          ? Column(
              children: [
                GetBuilder<PopularController>(
                    init: popularController,
                    builder: (PopularController controller) {
                      return Container(
                        height: Dimensions.pageView,
                        child: PageView.builder(
                            controller: pageController,
                            itemCount: controller.popularProductList.length,
                            itemBuilder: (context, index) {
                              Products popularProduct =
                                  controller.popularProductList[index];
                              return _buildPageItem(index, popularProduct);
                            }),
                      );
                    }),
                new DotsIndicator(
                  dotsCount: 5,
                  position: _currentPageValue,
                  decorator: DotsDecorator(
                    activeColor: AppColors.mainColor,
                    size: Size.square(Dimensions.width10),
                    activeSize: Size(Dimensions.width10 * 2, Dimensions.width10),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: Dimensions.height45),
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      bigText("Recommended"),
                      SizedBox(width: Dimensions.width10),
                      Container(
                          margin: EdgeInsets.only(bottom: Dimensions.height3),
                          child: bigText(".",
                              color: AppColors.blackColorWithOpacity)),
                      SizedBox(width: Dimensions.width10),
                      Container(
                          margin: EdgeInsets.only(bottom: Dimensions.height012),
                          child: smallText("Food pairing")),
                    ],
                  ),
                ),
                SizedBox(height: Dimensions.height20),
                GetBuilder<RecommendedController>(
                  init: recommendedController,
                  builder: (controller) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.recommendedProductList.length,
                      itemBuilder: (context, index) {
                        Products recommendedProduct =
                            controller.recommendedProductList[index];
    
                        String subtitle = "";
                        if (recommendedProduct.description!.length > 30) {
                          subtitle =
                              recommendedProduct.description!.substring(0, 30) +
                                  "...";
                        }
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.getRecommendedFood(index));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: Dimensions.width20,
                                vertical: Dimensions.height10),
                            child: Row(
                              children: [
                                Container(
                                  height: Dimensions.listViewImgSize,
                                  width: Dimensions.listViewImgSize,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius20),
                                      color: Colors.orange,
                                      image: DecorationImage(
                                        image:
                                            AssetImage("assets/images/food3.jpg"),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Expanded(
                                  child: Container(
                                    height: Dimensions.listViewTextContSize,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(
                                              Dimensions.radius20),
                                          bottomRight: Radius.circular(
                                              Dimensions.radius20),
                                        ),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xFFe8e8e8),
                                            blurRadius: 5,
                                            offset: Offset(0, 5),
                                          ),
                                        ]),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: Dimensions.width10,
                                          vertical: Dimensions.height10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          bigText("${recommendedProduct.name}"),
                                          SizedBox(height: Dimensions.height10),
                                          smallText("${subtitle}"),
                                          SizedBox(height: Dimensions.height10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              iconAndTextWidget(
                                                  "Normal",
                                                  Icons.circle_sharp,
                                                  AppColors.iconColor1),
                                              iconAndTextWidget(
                                                  "1.7km",
                                                  Icons.location_on,
                                                  AppColors.mainColor),
                                              iconAndTextWidget(
                                                  "32min",
                                                  Icons.access_time_rounded,
                                                  AppColors.iconColor2),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            )
          : CircularProgressIndicator(color: AppColors.mainColor, strokeWidth: 2),
    );
  }

  Widget _buildPageItem(int index, Products popularProduct) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _heigth * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _heigth * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
      ;
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _heigth * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
      ;
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _heigth * (1 - _scaleFactor) / 2, 0);
      ;
    }

    return Transform(
      transform: matrix,
      child: Stack(children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.getPopularFood(index));
          },
          child: Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.width30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                    image: AssetImage("assets/images/food1.jpg"),
                    fit: BoxFit.cover)),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
                bottom: Dimensions.height35),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ]),
            child: Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  left: Dimensions.width15,
                  right: Dimensions.width15),
              width: MediaQuery.of(context).size.width,
              child: columnDetailsFood("${popularProduct.name}"),
            ),
          ),
        ),
      ]),
    );
  }
}
