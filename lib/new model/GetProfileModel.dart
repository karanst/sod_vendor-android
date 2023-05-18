/// response_code : "1"
/// message : "Get Successfully"
/// status : "success"
/// data : [{"id":"43","email":"karanfoodvndor@gmail.com","mobile":"7788991234","address":"Vijay Nagar, Indore, Madhya Pradesh 452010, India","description":"","category_id":null,"per_d_charge":null,"per_h_charge":null,"experience":null,"vehicle_number":null,"vehicle_type":null,"rc_book":null,"per_km_charge":null,"lat":"","lang":"","uname":"Karan","password":"25d55ad283aa400af464c76d713c07ad","profile_image":"https://alphawizzserver.com/sod_india/uploads/profile_pics/64636553e788b.png","device_token":"c3q09gOVTw6j8nAJ6bFdUq:APA91bH1uHCk62pu3fwRGdz9nbGPg6eWJwFf-nDZjpSXxP5cRZZxk_5xHVU5_0v2vuiVFrKjSmNi1uLl20F4310Mk3ICl7XTlO8K2PndKwGmO3Idc-Cyh1X7bHt7eQb1tw_l8SLHcoDQ","otp":"1309","status":"0","wallet":"600.00","balance":"0.00","last_login":null,"created_at":"2023-05-16 11:13:23","updated_at":"2023-05-18 06:12:47","roll":"1","adhar_card":"https://alphawizzserver.com/sod_india/uploads/profile_pics/646365539d507.png","pancard":"https://alphawizzserver.com/sod_india/uploads/profile_pics/64636553e3e58.png","gst_no":"5677543678","fssai":"76786298374907","store_name":"Karan Coffee Shop","band_details":{"UPI":"8770496666@ybl"},"city_id":"0","vehicle_no":"","registarion_card":"","driving_license":"","categories_id":"","company_name":"","role_user":"","event":"","latitude":"null","longitude":"null","delivery_type":"","refferal_code":"SOD603700","friend_code":"","online_status":"1","store_description":"This is coffee shop","commision":"","resto_type":"Both","gender":null,"cash_collection":"0","commision_amount_type":"","adhar_back":"64636553a04e5.png","rc_book_back":"","driving_license_back":"","fssai_image":"","gst_image":""}]
/// image_path : "https://alphawizzserver.com/sod_india/uploads/profile_pics/"

class GetProfileModel {
  GetProfileModel({
      String? responseCode, 
      String? message, 
      String? status, 
      List<Data>? data, 
      String? imagePath,}){
    _responseCode = responseCode;
    _message = message;
    _status = status;
    _data = data;
    _imagePath = imagePath;
}

  GetProfileModel.fromJson(dynamic json) {
    _responseCode = json['response_code'];
    _message = json['message'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _imagePath = json['image_path'];
  }
  String? _responseCode;
  String? _message;
  String? _status;
  List<Data>? _data;
  String? _imagePath;
GetProfileModel copyWith({  String? responseCode,
  String? message,
  String? status,
  List<Data>? data,
  String? imagePath,
}) => GetProfileModel(  responseCode: responseCode ?? _responseCode,
  message: message ?? _message,
  status: status ?? _status,
  data: data ?? _data,
  imagePath: imagePath ?? _imagePath,
);
  String? get responseCode => _responseCode;
  String? get message => _message;
  String? get status => _status;
  List<Data>? get data => _data;
  String? get imagePath => _imagePath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response_code'] = _responseCode;
    map['message'] = _message;
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['image_path'] = _imagePath;
    return map;
  }

}

/// id : "43"
/// email : "karanfoodvndor@gmail.com"
/// mobile : "7788991234"
/// address : "Vijay Nagar, Indore, Madhya Pradesh 452010, India"
/// description : ""
/// category_id : null
/// per_d_charge : null
/// per_h_charge : null
/// experience : null
/// vehicle_number : null
/// vehicle_type : null
/// rc_book : null
/// per_km_charge : null
/// lat : ""
/// lang : ""
/// uname : "Karan"
/// password : "25d55ad283aa400af464c76d713c07ad"
/// profile_image : "https://alphawizzserver.com/sod_india/uploads/profile_pics/64636553e788b.png"
/// device_token : "c3q09gOVTw6j8nAJ6bFdUq:APA91bH1uHCk62pu3fwRGdz9nbGPg6eWJwFf-nDZjpSXxP5cRZZxk_5xHVU5_0v2vuiVFrKjSmNi1uLl20F4310Mk3ICl7XTlO8K2PndKwGmO3Idc-Cyh1X7bHt7eQb1tw_l8SLHcoDQ"
/// otp : "1309"
/// status : "0"
/// wallet : "600.00"
/// balance : "0.00"
/// last_login : null
/// created_at : "2023-05-16 11:13:23"
/// updated_at : "2023-05-18 06:12:47"
/// roll : "1"
/// adhar_card : "https://alphawizzserver.com/sod_india/uploads/profile_pics/646365539d507.png"
/// pancard : "https://alphawizzserver.com/sod_india/uploads/profile_pics/64636553e3e58.png"
/// gst_no : "5677543678"
/// fssai : "76786298374907"
/// store_name : "Karan Coffee Shop"
/// band_details : {"UPI":"8770496666@ybl"}
/// city_id : "0"
/// vehicle_no : ""
/// registarion_card : ""
/// driving_license : ""
/// categories_id : ""
/// company_name : ""
/// role_user : ""
/// event : ""
/// latitude : "null"
/// longitude : "null"
/// delivery_type : ""
/// refferal_code : "SOD603700"
/// friend_code : ""
/// online_status : "1"
/// store_description : "This is coffee shop"
/// commision : ""
/// resto_type : "Both"
/// gender : null
/// cash_collection : "0"
/// commision_amount_type : ""
/// adhar_back : "64636553a04e5.png"
/// rc_book_back : ""
/// driving_license_back : ""
/// fssai_image : ""
/// gst_image : ""

class Data {
  Data({
      String? id, 
      String? email, 
      String? mobile, 
      String? address, 
      String? description, 
      dynamic categoryId, 
      dynamic perDCharge, 
      dynamic perHCharge, 
      dynamic experience, 
      dynamic vehicleNumber, 
      dynamic vehicleType, 
      dynamic rcBook, 
      dynamic perKmCharge, 
      String? lat, 
      String? lang, 
      String? uname, 
      String? password, 
      String? profileImage, 
      String? deviceToken, 
      String? otp, 
      String? status, 
      String? wallet, 
      String? balance, 
      dynamic lastLogin, 
      String? createdAt, 
      String? updatedAt, 
      String? roll, 
      String? adharCard, 
      String? pancard, 
      String? gstNo, 
      String? fssai, 
      String? storeName, 
      BandDetails? bandDetails, 
      String? cityId, 
      String? vehicleNo, 
      String? registarionCard, 
      String? drivingLicense, 
      String? categoriesId, 
      String? companyName, 
      String? roleUser, 
      String? event, 
      String? latitude, 
      String? longitude, 
      String? deliveryType, 
      String? refferalCode, 
      String? friendCode, 
      String? onlineStatus, 
      String? storeDescription, 
      String? commision, 
      String? restoType, 
      dynamic gender, 
      String? cashCollection, 
      String? commisionAmountType, 
      String? adharBack, 
      String? rcBookBack, 
      String? drivingLicenseBack, 
      String? fssaiImage, 
      String? gstImage,}){
    _id = id;
    _email = email;
    _mobile = mobile;
    _address = address;
    _description = description;
    _categoryId = categoryId;
    _perDCharge = perDCharge;
    _perHCharge = perHCharge;
    _experience = experience;
    _vehicleNumber = vehicleNumber;
    _vehicleType = vehicleType;
    _rcBook = rcBook;
    _perKmCharge = perKmCharge;
    _lat = lat;
    _lang = lang;
    _uname = uname;
    _password = password;
    _profileImage = profileImage;
    _deviceToken = deviceToken;
    _otp = otp;
    _status = status;
    _wallet = wallet;
    _balance = balance;
    _lastLogin = lastLogin;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _roll = roll;
    _adharCard = adharCard;
    _pancard = pancard;
    _gstNo = gstNo;
    _fssai = fssai;
    _storeName = storeName;
    _bandDetails = bandDetails;
    _cityId = cityId;
    _vehicleNo = vehicleNo;
    _registarionCard = registarionCard;
    _drivingLicense = drivingLicense;
    _categoriesId = categoriesId;
    _companyName = companyName;
    _roleUser = roleUser;
    _event = event;
    _latitude = latitude;
    _longitude = longitude;
    _deliveryType = deliveryType;
    _refferalCode = refferalCode;
    _friendCode = friendCode;
    _onlineStatus = onlineStatus;
    _storeDescription = storeDescription;
    _commision = commision;
    _restoType = restoType;
    _gender = gender;
    _cashCollection = cashCollection;
    _commisionAmountType = commisionAmountType;
    _adharBack = adharBack;
    _rcBookBack = rcBookBack;
    _drivingLicenseBack = drivingLicenseBack;
    _fssaiImage = fssaiImage;
    _gstImage = gstImage;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _email = json['email'];
    _mobile = json['mobile'];
    _address = json['address'];
    _description = json['description'];
    _categoryId = json['category_id'];
    _perDCharge = json['per_d_charge'];
    _perHCharge = json['per_h_charge'];
    _experience = json['experience'];
    _vehicleNumber = json['vehicle_number'];
    _vehicleType = json['vehicle_type'];
    _rcBook = json['rc_book'];
    _perKmCharge = json['per_km_charge'];
    _lat = json['lat'];
    _lang = json['lang'];
    _uname = json['uname'];
    _password = json['password'];
    _profileImage = json['profile_image'];
    _deviceToken = json['device_token'];
    _otp = json['otp'];
    _status = json['status'];
    _wallet = json['wallet'];
    _balance = json['balance'];
    _lastLogin = json['last_login'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _roll = json['roll'];
    _adharCard = json['adhar_card'];
    _pancard = json['pancard'];
    _gstNo = json['gst_no'];
    _fssai = json['fssai'];
    _storeName = json['store_name'];
    _bandDetails = json['band_details'] != null ? BandDetails.fromJson(json['band_details']) : null;
    _cityId = json['city_id'];
    _vehicleNo = json['vehicle_no'];
    _registarionCard = json['registarion_card'];
    _drivingLicense = json['driving_license'];
    _categoriesId = json['categories_id'];
    _companyName = json['company_name'];
    _roleUser = json['role_user'];
    _event = json['event'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _deliveryType = json['delivery_type'];
    _refferalCode = json['refferal_code'];
    _friendCode = json['friend_code'];
    _onlineStatus = json['online_status'];
    _storeDescription = json['store_description'];
    _commision = json['commision'];
    _restoType = json['resto_type'];
    _gender = json['gender'];
    _cashCollection = json['cash_collection'];
    _commisionAmountType = json['commision_amount_type'];
    _adharBack = json['adhar_back'];
    _rcBookBack = json['rc_book_back'];
    _drivingLicenseBack = json['driving_license_back'];
    _fssaiImage = json['fssai_image'];
    _gstImage = json['gst_image'];
  }
  String? _id;
  String? _email;
  String? _mobile;
  String? _address;
  String? _description;
  dynamic _categoryId;
  dynamic _perDCharge;
  dynamic _perHCharge;
  dynamic _experience;
  dynamic _vehicleNumber;
  dynamic _vehicleType;
  dynamic _rcBook;
  dynamic _perKmCharge;
  String? _lat;
  String? _lang;
  String? _uname;
  String? _password;
  String? _profileImage;
  String? _deviceToken;
  String? _otp;
  String? _status;
  String? _wallet;
  String? _balance;
  dynamic _lastLogin;
  String? _createdAt;
  String? _updatedAt;
  String? _roll;
  String? _adharCard;
  String? _pancard;
  String? _gstNo;
  String? _fssai;
  String? _storeName;
  BandDetails? _bandDetails;
  String? _cityId;
  String? _vehicleNo;
  String? _registarionCard;
  String? _drivingLicense;
  String? _categoriesId;
  String? _companyName;
  String? _roleUser;
  String? _event;
  String? _latitude;
  String? _longitude;
  String? _deliveryType;
  String? _refferalCode;
  String? _friendCode;
  String? _onlineStatus;
  String? _storeDescription;
  String? _commision;
  String? _restoType;
  dynamic _gender;
  String? _cashCollection;
  String? _commisionAmountType;
  String? _adharBack;
  String? _rcBookBack;
  String? _drivingLicenseBack;
  String? _fssaiImage;
  String? _gstImage;
Data copyWith({  String? id,
  String? email,
  String? mobile,
  String? address,
  String? description,
  dynamic categoryId,
  dynamic perDCharge,
  dynamic perHCharge,
  dynamic experience,
  dynamic vehicleNumber,
  dynamic vehicleType,
  dynamic rcBook,
  dynamic perKmCharge,
  String? lat,
  String? lang,
  String? uname,
  String? password,
  String? profileImage,
  String? deviceToken,
  String? otp,
  String? status,
  String? wallet,
  String? balance,
  dynamic lastLogin,
  String? createdAt,
  String? updatedAt,
  String? roll,
  String? adharCard,
  String? pancard,
  String? gstNo,
  String? fssai,
  String? storeName,
  BandDetails? bandDetails,
  String? cityId,
  String? vehicleNo,
  String? registarionCard,
  String? drivingLicense,
  String? categoriesId,
  String? companyName,
  String? roleUser,
  String? event,
  String? latitude,
  String? longitude,
  String? deliveryType,
  String? refferalCode,
  String? friendCode,
  String? onlineStatus,
  String? storeDescription,
  String? commision,
  String? restoType,
  dynamic gender,
  String? cashCollection,
  String? commisionAmountType,
  String? adharBack,
  String? rcBookBack,
  String? drivingLicenseBack,
  String? fssaiImage,
  String? gstImage,
}) => Data(  id: id ?? _id,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
  address: address ?? _address,
  description: description ?? _description,
  categoryId: categoryId ?? _categoryId,
  perDCharge: perDCharge ?? _perDCharge,
  perHCharge: perHCharge ?? _perHCharge,
  experience: experience ?? _experience,
  vehicleNumber: vehicleNumber ?? _vehicleNumber,
  vehicleType: vehicleType ?? _vehicleType,
  rcBook: rcBook ?? _rcBook,
  perKmCharge: perKmCharge ?? _perKmCharge,
  lat: lat ?? _lat,
  lang: lang ?? _lang,
  uname: uname ?? _uname,
  password: password ?? _password,
  profileImage: profileImage ?? _profileImage,
  deviceToken: deviceToken ?? _deviceToken,
  otp: otp ?? _otp,
  status: status ?? _status,
  wallet: wallet ?? _wallet,
  balance: balance ?? _balance,
  lastLogin: lastLogin ?? _lastLogin,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  roll: roll ?? _roll,
  adharCard: adharCard ?? _adharCard,
  pancard: pancard ?? _pancard,
  gstNo: gstNo ?? _gstNo,
  fssai: fssai ?? _fssai,
  storeName: storeName ?? _storeName,
  bandDetails: bandDetails ?? _bandDetails,
  cityId: cityId ?? _cityId,
  vehicleNo: vehicleNo ?? _vehicleNo,
  registarionCard: registarionCard ?? _registarionCard,
  drivingLicense: drivingLicense ?? _drivingLicense,
  categoriesId: categoriesId ?? _categoriesId,
  companyName: companyName ?? _companyName,
  roleUser: roleUser ?? _roleUser,
  event: event ?? _event,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  deliveryType: deliveryType ?? _deliveryType,
  refferalCode: refferalCode ?? _refferalCode,
  friendCode: friendCode ?? _friendCode,
  onlineStatus: onlineStatus ?? _onlineStatus,
  storeDescription: storeDescription ?? _storeDescription,
  commision: commision ?? _commision,
  restoType: restoType ?? _restoType,
  gender: gender ?? _gender,
  cashCollection: cashCollection ?? _cashCollection,
  commisionAmountType: commisionAmountType ?? _commisionAmountType,
  adharBack: adharBack ?? _adharBack,
  rcBookBack: rcBookBack ?? _rcBookBack,
  drivingLicenseBack: drivingLicenseBack ?? _drivingLicenseBack,
  fssaiImage: fssaiImage ?? _fssaiImage,
  gstImage: gstImage ?? _gstImage,
);
  String? get id => _id;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get address => _address;
  String? get description => _description;
  dynamic get categoryId => _categoryId;
  dynamic get perDCharge => _perDCharge;
  dynamic get perHCharge => _perHCharge;
  dynamic get experience => _experience;
  dynamic get vehicleNumber => _vehicleNumber;
  dynamic get vehicleType => _vehicleType;
  dynamic get rcBook => _rcBook;
  dynamic get perKmCharge => _perKmCharge;
  String? get lat => _lat;
  String? get lang => _lang;
  String? get uname => _uname;
  String? get password => _password;
  String? get profileImage => _profileImage;
  String? get deviceToken => _deviceToken;
  String? get otp => _otp;
  String? get status => _status;
  String? get wallet => _wallet;
  String? get balance => _balance;
  dynamic get lastLogin => _lastLogin;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get roll => _roll;
  String? get adharCard => _adharCard;
  String? get pancard => _pancard;
  String? get gstNo => _gstNo;
  String? get fssai => _fssai;
  String? get storeName => _storeName;
  BandDetails? get bandDetails => _bandDetails;
  String? get cityId => _cityId;
  String? get vehicleNo => _vehicleNo;
  String? get registarionCard => _registarionCard;
  String? get drivingLicense => _drivingLicense;
  String? get categoriesId => _categoriesId;
  String? get companyName => _companyName;
  String? get roleUser => _roleUser;
  String? get event => _event;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get deliveryType => _deliveryType;
  String? get refferalCode => _refferalCode;
  String? get friendCode => _friendCode;
  String? get onlineStatus => _onlineStatus;
  String? get storeDescription => _storeDescription;
  String? get commision => _commision;
  String? get restoType => _restoType;
  dynamic get gender => _gender;
  String? get cashCollection => _cashCollection;
  String? get commisionAmountType => _commisionAmountType;
  String? get adharBack => _adharBack;
  String? get rcBookBack => _rcBookBack;
  String? get drivingLicenseBack => _drivingLicenseBack;
  String? get fssaiImage => _fssaiImage;
  String? get gstImage => _gstImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['address'] = _address;
    map['description'] = _description;
    map['category_id'] = _categoryId;
    map['per_d_charge'] = _perDCharge;
    map['per_h_charge'] = _perHCharge;
    map['experience'] = _experience;
    map['vehicle_number'] = _vehicleNumber;
    map['vehicle_type'] = _vehicleType;
    map['rc_book'] = _rcBook;
    map['per_km_charge'] = _perKmCharge;
    map['lat'] = _lat;
    map['lang'] = _lang;
    map['uname'] = _uname;
    map['password'] = _password;
    map['profile_image'] = _profileImage;
    map['device_token'] = _deviceToken;
    map['otp'] = _otp;
    map['status'] = _status;
    map['wallet'] = _wallet;
    map['balance'] = _balance;
    map['last_login'] = _lastLogin;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['roll'] = _roll;
    map['adhar_card'] = _adharCard;
    map['pancard'] = _pancard;
    map['gst_no'] = _gstNo;
    map['fssai'] = _fssai;
    map['store_name'] = _storeName;
    if (_bandDetails != null) {
      map['band_details'] = _bandDetails?.toJson();
    }
    map['city_id'] = _cityId;
    map['vehicle_no'] = _vehicleNo;
    map['registarion_card'] = _registarionCard;
    map['driving_license'] = _drivingLicense;
    map['categories_id'] = _categoriesId;
    map['company_name'] = _companyName;
    map['role_user'] = _roleUser;
    map['event'] = _event;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['delivery_type'] = _deliveryType;
    map['refferal_code'] = _refferalCode;
    map['friend_code'] = _friendCode;
    map['online_status'] = _onlineStatus;
    map['store_description'] = _storeDescription;
    map['commision'] = _commision;
    map['resto_type'] = _restoType;
    map['gender'] = _gender;
    map['cash_collection'] = _cashCollection;
    map['commision_amount_type'] = _commisionAmountType;
    map['adhar_back'] = _adharBack;
    map['rc_book_back'] = _rcBookBack;
    map['driving_license_back'] = _drivingLicenseBack;
    map['fssai_image'] = _fssaiImage;
    map['gst_image'] = _gstImage;
    return map;
  }

}

/// UPI : "8770496666@ybl"

class BandDetails {
  BandDetails({
      String? upi,}){
    _upi = upi;
}

  BandDetails.fromJson(dynamic json) {
    _upi = json['UPI'];
  }
  String? _upi;
BandDetails copyWith({  String? upi,
}) => BandDetails(  upi: upi ?? _upi,
);
  String? get upi => _upi;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UPI'] = _upi;
    return map;
  }

}