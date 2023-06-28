import 'package:eisteintaste/global/widgets/show_snack_bar.dart';
import 'package:eisteintaste/models/address_model.dart';
import 'package:eisteintaste/models/api_response.dart';
import 'package:eisteintaste/modules/address/repository/address_repository.dart';
import 'package:eisteintaste/modules/profile/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressController extends GetxController {
  AddressRepository _addressRepo = Get.find<AddressRepository>();
  
  List<dynamic> _addressList = [];
  List<dynamic> get addressList => _addressList;

  List<String> _addressTypeList = ["Home", "Office", "Other"];
  List<String> get addressTypeList => _addressTypeList;
  int _addressTypeIndex = 0;
  int get addressTypeIndex => _addressTypeIndex;

  RxBool _isLoaded = false.obs;
  RxBool get isLoaded => _isLoaded;
  bool _isChangeAddress = false;
  RxBool _isMapLoaded = false.obs;
  RxBool get isMapLoaded => _isMapLoaded;

  late Position _position;
  Position get position => _position;
  late Position _pickPosition;
  Placemark _placemark = Placemark();
  Placemark get placemark => _placemark;
  Placemark _pickPlacemark = Placemark();
  Placemark get pickPlacemark => _pickPlacemark;

  late GoogleMapController _mapController;

  bool _isUpdateAddressData = false;
  bool get isUpdateAddressData => _isUpdateAddressData;
  
  final TextEditingController addressTextController = TextEditingController();

  final TextEditingController contactNameTextController = TextEditingController();
  final TextEditingController contactNumberTextController = TextEditingController();
  LatLng _initialPosition = LatLng(-24.73338696153586, -53.73685178225833);
  LatLng get initialPosition => _initialPosition;

  @override
  void onInit() async {
    super.onInit();
    await getUserAddress();
    setAddressTypeIndex(0);
  }

  void setMapController(GoogleMapController mapController) {
    _mapController = mapController;
  }
  void updatePosition(CameraPosition position, bool isFromAddress) async {
    if(_isUpdateAddressData){

      try{
        if(isFromAddress){
          _position = Position(
            latitude: position.target.latitude,
            longitude: position.target.longitude,
            timestamp: DateTime.now(),
            heading: 1, accuracy: 1,altitude: 1,speed: 1,speedAccuracy: 1
          );
        }else{
          _pickPosition = Position(
            latitude: position.target.latitude,
            longitude: position.target.longitude,
            timestamp: DateTime.now(),
            heading: 1, accuracy: 1,altitude: 1,speed: 1,speedAccuracy: 1
          );
        }
        if(!_isChangeAddress){
          Placemark? _address = await getAddressFromGeoCode(LatLng(position.target.latitude, position.target.longitude));
          if(_address != null){
            isFromAddress ? _placemark = _address : _pickPlacemark = _address;
          }else{
            isFromAddress ? _placemark = Placemark() : _pickPlacemark = Placemark();
          }
        }
        isMapLoaded.value = true;
        update();
      }catch(e){
        print(e);
      }
      
    }
  }
  Future<Placemark?> getAddressFromGeoCode(LatLng latLng) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    if(placemarks.isNotEmpty){
      Placemark place = placemarks[0];
      
      // String _address = "${place.name}, ${place.street}, ${place.subLocality}, ${place.postalCode}, ${place.subAdministrativeArea} ${place.administrativeArea}}";
      // print(_address);
      return place;
    }
    return null;
  }
  String placemarkToString(Placemark placemark){
    String _address = "${placemark.name}, ${placemark.street}, ${placemark.subLocality}, ${placemark.postalCode}, ${placemark.subAdministrativeArea} - ${placemark.administrativeArea}";
    return _address;
  }
  Future<void> getUserAddress() async {
    ApiResponse response = await _addressRepo.getUserAddress(Get.find<UserController>().user.id!);
    if(response.error == null){
      if(response.data != null){
        _addressList = response.data as List<dynamic>;
       
        _isLoaded.value = true;
        if(_addressList.isNotEmpty){
          _isUpdateAddressData = true;
        } 
        update();
        //showMessageSnackbarBottom("Address loaded successfully");
      }else{
        showMessageTop("Alert", "Problem loading address: ${response.error}");
      }
    }
    print(_addressList.length);
  }
  void addAddress() async{
    Address address = Address(address: addressTextController.text,
      user_id: Get.find<UserController>().user.id,
      contactPersonName: contactNameTextController.text,
      contactPersonNumber: contactNumberTextController.text,
      latitude: position.latitude.toString(),
      longitude: position.longitude.toString(),
      addressType: addressTypeList[addressTypeIndex]
    );
    ApiResponse response = await _addressRepo.addAddress(address);
    if(response.error == null){
      if(response.data != null){
        _addressList.add(response.data as Address);
        showMessageSnackbarBottom("Added address successfully");
      }else{
        showMessageTop("Alert", "${response.error}");
      }
    }
  }
  void updateAddress() async{
    _addressList[addressTypeIndex].address = addressTextController.text;
    _addressList[addressTypeIndex].contactPersonName = contactNameTextController.text;
    _addressList[addressTypeIndex].contactPersonNumber = contactNumberTextController.text;
    ApiResponse response = await _addressRepo.editAddress(_addressList[_addressTypeIndex]);
    if(response.error == null){
      update();
      showMessageSnackbarBottom("Address updated successfully");
    }else{
      showMessageTop("Alert", "${response.error}");
    }
  }
  void setAddressTypeIndex(int index){
    _addressTypeIndex = index;
    isMapLoaded.value = false;
    late CameraPosition cameraPosition;
    if(index < _addressList.length){
      updateControllers(_addressList[_addressTypeIndex].address, _addressList[_addressTypeIndex].contactPersonName, _addressList[_addressTypeIndex].contactPersonNumber);
      _initialPosition = LatLng(double.parse(_addressList[_addressTypeIndex].latitude), double.parse(_addressList[_addressTypeIndex].longitude));
      cameraPosition = CameraPosition(target: _initialPosition, zoom: 15);
    }else{
      _initialPosition = LatLng(-24.73338696153586, -53.73685178225833);
      cameraPosition = CameraPosition(target: _initialPosition, zoom: 15);
      updateControllers("", "", "");
    }
    updatePosition(cameraPosition, false);
    update();
  }

  void reset(){

  }

  void updateControllers(String address, String name, String number){
    addressTextController.text = address;
    contactNameTextController.text = name;
    contactNumberTextController.text = number;
    update();
  }
}
