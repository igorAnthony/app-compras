import 'package:eisteintaste/global/constant/dimensions.dart';
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
  late GoogleMapController _mapController;
  late CameraPosition _cameraPosition;
  late LatLng _initialLatLng;

  @override
  void initState() {
    super.initState();
    AddressController addressController = Get.find<AddressController>();
    _initialLatLng = addressController.initialPosition;
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
                    
                  ),
                ),
              ],
            ),
          ))) 
        );
  }
}
