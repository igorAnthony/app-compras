import 'package:eisteintaste/global/constant/colors.dart';
import 'package:eisteintaste/global/constant/dimensions.dart';
import 'package:eisteintaste/global/widgets/text.dart';
import 'package:eisteintaste/modules/address/controller/address_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickAddressMapView extends StatefulWidget {
  const PickAddressMapView({super.key});

  @override
  State<PickAddressMapView> createState() => _PickAddressMapViewState();
}

class _PickAddressMapViewState extends State<PickAddressMapView> {
  late CameraPosition _cameraPosition;
  late LatLng _initialLatLng;

  @override
  void initState() {
    super.initState();
    AddressController addressController = Get.find<AddressController>();
    _initialLatLng = LatLng(
      double.parse(addressController.addressListTemp[addressController.addressTypeIndex].latitude!), 
      double.parse(addressController.addressListTemp[addressController.addressTypeIndex].longitude!));
    _cameraPosition = CameraPosition(target: _initialLatLng, zoom: 15.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: double.maxFinite,
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _initialLatLng, 
                    zoom: 17
                  ),
                  zoomControlsEnabled: false,
                  onCameraMove: (position) {
                    _cameraPosition = position;
                  },
                  onCameraIdle: () {
                    Get.find<AddressController>().updatePosition(_cameraPosition, false);
                  },
                ),
                Center(
                  child: Obx(() => Get.find<AddressController>().isMapLoaded.value ? Container(
                    child: Icon(Icons.location_on, color: Colors.red, size: 50)
                  ) : CircularProgressIndicator()),
                ),
                Positioned(
                  top: Dimensions.height45,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(Dimensions.height15),
                     
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.location_on, size: Dimensions.iconSize24, color: Colors.white),
                        Expanded(
                          child: GetBuilder<AddressController>(
                            init: Get.find<AddressController>(),
                            builder: (controller) {
                              return Text(
                                "${controller.addressTextController.text}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.font14,
                                  fontWeight: FontWeight.w500
                                ),
                                overflow: TextOverflow.ellipsis,
                              );
                            },
                          )
                        ),
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: Get.find<AddressController>().isMapLoaded.value,
                    child: Positioned(
                      bottom: Dimensions.height45,
                      left: Dimensions.width50,
                      right: Dimensions.width50,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 100,
                          padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
                          child:  Center(child: bigText("Pick Address",  size: Dimensions.font14, color: Colors.white)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius10),
                            color: AppColors.mainColor.withOpacity(0.8),
                          ),
                                          ),
                      ),),
                  ),
                )
              ],
            ),
          ))) 
        );
  }
}
