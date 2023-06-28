class Address{
  late int? _id;
  late int _user_id;
  late String _addressType;
  late String _contactPersonName;
  late String _contactPersonNumber;
  late String _address;
  late String _latitude;
  late String _longitude;
  late String? _created_at;
  late String? _updated_at;

  Address({
    id,
    user_id, 
    required addressType, 
    contactPersonName, 
    contactPersonNumber, 
    address, 
    latitude, 
    longitude
  }){
    _id = id;
    _user_id = user_id;
    _addressType = addressType;
    _contactPersonName = contactPersonName;
    _contactPersonNumber = contactPersonNumber;
    _address = address;
    _latitude = latitude;
    _longitude = longitude;
  }
  String get address => _address;
  String get addressType => _addressType;
  String get contactPersonName => _contactPersonName;
  String get contactPersonNumber => _contactPersonNumber;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  int get user_id => _user_id;
  int? get id => _id;
  
  set address(String address){
    _address = address;
  }
  set addressType(String addressType){
    _addressType = addressType;
  }
  set contactPersonName(String contactPersonName){
    _contactPersonName = contactPersonName;
  }
  set contactPersonNumber(String contactPersonNumber){
    _contactPersonNumber = contactPersonNumber;
  }

  Address.fromJson(Map<String, dynamic> json){
    _id = json['id'];
    _user_id = json['user_id'];
    _addressType = json['addressType'];
    _contactPersonNumber = json['contact_person_number'];
    _contactPersonName = json['contact_person_name'];
    _address = json['address'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _created_at = json['created_at'];
    _updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': _id,
      'user_id': _user_id,
      'addressType': _addressType,
      'contact_person_name': _contactPersonName,
      'contact_person_number': _contactPersonNumber,
      'address': _address,
      'latitude': _latitude,
      'longitude': _longitude,
    };
  }
}