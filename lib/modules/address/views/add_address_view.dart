import 'package:eisteintaste/global/constant/colors.dart';
import 'package:eisteintaste/global/constant/decoration.dart';
import 'package:eisteintaste/global/constant/dimensions.dart';
import 'package:eisteintaste/global/constant/route.dart';
import 'package:eisteintaste/global/widgets/text.dart';
import 'package:eisteintaste/modules/address/controller/address_controller.dart';
import 'package:eisteintaste/modules/profile/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressView extends StatefulWidget {
  const AddAddressView({super.key});

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {


  late bool _isLogged;
  CameraPosition _cameraPosition = CameraPosition(target: LatLng(-24.73338696153586, -53.73685178225833)
  , zoom: 15.0);

  LatLng _initialPosition = LatLng(-24.73338696153586, -53.73685178225833);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLogged = Get.find<UserController>().isLogged;
    if(!_isLogged){
      Get.offAllNamed(Routes.loginRoute);
    }
    AddressController addressController = Get.find<AddressController>();
    if(Get.find<AddressController>().addressList.isNotEmpty){
      _cameraPosition = CameraPosition(
        target: LatLng(
          double.parse(addressController.addressList[addressController.addressTypeIndex].latitude!), 
          double.parse(addressController.addressList[addressController.addressTypeIndex].longitude!)));
      _initialPosition = LatLng(
          double.parse(addressController.addressList[addressController.addressTypeIndex].latitude!), 
          double.parse(addressController.addressList[addressController.addressTypeIndex].longitude!));
    }
    
  }

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Address", style: TextStyle(
          color: Colors.white,
          
        )),
        backgroundColor: AppColors.mainColor,
      ),
      backgroundColor: Colors.white,
      body: GetBuilder<AddressController>(
        init: Get.find<AddressController>(),
        builder: (addressController) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                  height: 140,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      GoogleMap(initialCameraPosition: CameraPosition(
                        target: _initialPosition, zoom: 15.0),
                        zoomControlsEnabled: false,
                        compassEnabled: false,
                        indoorViewEnabled: true,
                        mapToolbarEnabled: false,
                        myLocationEnabled: true,
                        onCameraIdle: () {
                          addressController.updatePosition(_cameraPosition, true);
                        },
                        onCameraMove: (CameraPosition position) {
                          _cameraPosition = position;
                        },
                        onMapCreated: (GoogleMapController controller) {
                          addressController.setMapController(controller);
                        },
                        onTap: (latlng) {
                          addressController.isMapLoaded.value = false;
                          Get.toNamed(Routes.pickAddressMapRoute);
                        },
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 2,
                      color: AppColors.mainColor
                    )
                  ),
                ),
                SizedBox(height: Dimensions.height40),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  height:Dimensions.height45, child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: addressController.addressTypeList.length,
                  itemBuilder: (context, index){
                  return Padding(
                    padding: EdgeInsets.only(right: Dimensions.width10),
                    child: GestureDetector(
                      onTap: () {
                        addressController.setAddressTypeIndex(index);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 4,
                            )
                          ]
                        ),
                        child: Row(
                          children: [
                            Icon(
                              index == 0 ? Icons.home : index == 1 ? Icons.work : Icons.location_on,
                              color: addressController.addressTypeIndex==index ? AppColors.mainColor : Theme.of(context).disabledColor
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })),
                SizedBox(height: Dimensions.height20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      bigText("Delivery Address"),
                      SizedBox(height: Dimensions.height10),
                      Container(
                        decoration: boxDecorationWithBoxShadow(borderRadius: Dimensions.radius10),
                        child: appTextField(addressController.addressTextController, "Your address", Icons.map)
                      ),
                      SizedBox(height: Dimensions.height20),
                      bigText("Contact name"),
                      SizedBox(height: Dimensions.height10),
                      Container(
                        decoration: boxDecorationWithBoxShadow(borderRadius: Dimensions.radius10),
                        child: appTextField(addressController.contactNameTextController, "Your name", Icons.person),
                      ),
                      SizedBox(height: Dimensions.height20),
                      bigText("Contact number"),
                      SizedBox(height: Dimensions.height10),
                      Container(
                        decoration: boxDecorationWithBoxShadow(borderRadius: Dimensions.radius10),
                        child: appTextField(addressController.contactNumberTextController, "Your number", Icons.phone), 
                      )
                    ],
                  ),
                )
                
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: GetBuilder<AddressController>(
        builder: (addressController) {
          return Container(
            height: Dimensions.height110,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20),
                topRight: Radius.circular(Dimensions.radius20),
              ),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: Dimensions.height20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if(addressController.isUpdateAddressData){
                        addressController.updateAddress();
                      }else{ 
                        addressController.addAddress();
                      }
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child:  bigText("Save address",  size: Dimensions.font24, color: Colors.white),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
      },)
    );
  }
}