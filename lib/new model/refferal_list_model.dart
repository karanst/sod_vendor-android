/// status : true
/// message : "Referral list"
/// data : [{"id":"77","user_id":"76","user_type":"1","amount":"50.00","transaction_id":"Refferal Amount Transfer-50","created_at":"2023-05-20 16:43:53","updated_at":"2023-05-20 16:47:39","refferal_status":"0","level":"level 1","refferal_id":"77","status":"1","email":"chotu27@gmail.com","mobile":"976466464666","address":"151, Ward 35, Ratna Lok Colony, Indore, Madhya Pradesh 452010, India","description":"","category_id":null,"per_d_charge":null,"per_h_charge":null,"experience":null,"vehicle_number":null,"vehicle_type":null,"rc_book":null,"per_km_charge":null,"lat":"","lang":"","uname":"chotu 2","password":"28a444b13e8c479ae034d22ce118e07a","profile_image":"","device_token":"fbm0xGvwTWSZ-yz2sK5JZ1:APA91bGo5v6hWeDrfALKhuuc3MfrgvLZPZcI5BdHwXUFNcCyOp7dGocCU_NeI9xjO69ZpHcD6Wfb1Q2L3AwdrDD4ztlpp-1h9FEHqaZH2vnERNnmOP8Q_0WR6fajYCHEhfyZC3VEXZ27","otp":"1396","wallet":"100.00","balance":"0.00","last_login":null,"roll":"1","adhar_card":"6468ab6f8af41.jpg","pancard":"6468ab70748ee.jpg","gst_no":"test7737","fssai":"hzhsi8873","store_name":"refferal 2","band_details":"{\"UPI\" : \"test@upi\"}","city_id":"0","vehicle_no":"","registarion_card":"","driving_license":"","categories_id":"","company_name":"","role_user":"","event":"","latitude":"22.7468837","longitude":"75.8980128","delivery_type":"","refferal_code":"SOD449690","friend_code":"SOD542821","online_status":"1","store_description":"test","commision":"","resto_type":"Veg","gender":null,"cash_collection":"0","commision_amount_type":"","adhar_back":"6468ab6fb82df.jpg","rc_book_back":"","driving_license_back":"","fssai_image":"6468ab6fe70c7.jpg","gst_image":"","refferal_date":"2023-05-20 16:43:53"}]

class RefferalListModel {
  RefferalListModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  RefferalListModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<Data>? _data;
RefferalListModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => RefferalListModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "77"
/// user_id : "76"
/// user_type : "1"
/// amount : "50.00"
/// transaction_id : "Refferal Amount Transfer-50"
/// created_at : "2023-05-20 16:43:53"
/// updated_at : "2023-05-20 16:47:39"
/// refferal_status : "0"
/// level : "level 1"
/// refferal_id : "77"
/// status : "1"
/// email : "chotu27@gmail.com"
/// mobile : "976466464666"
/// address : "151, Ward 35, Ratna Lok Colony, Indore, Madhya Pradesh 452010, India"
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
/// uname : "chotu 2"
/// password : "28a444b13e8c479ae034d22ce118e07a"
/// profile_image : ""
/// device_token : "fbm0xGvwTWSZ-yz2sK5JZ1:APA91bGo5v6hWeDrfALKhuuc3MfrgvLZPZcI5BdHwXUFNcCyOp7dGocCU_NeI9xjO69ZpHcD6Wfb1Q2L3AwdrDD4ztlpp-1h9FEHqaZH2vnERNnmOP8Q_0WR6fajYCHEhfyZC3VEXZ27"
/// otp : "1396"
/// wallet : "100.00"
/// balance : "0.00"
/// last_login : null
/// roll : "1"
/// adhar_card : "6468ab6f8af41.jpg"
/// pancard : "6468ab70748ee.jpg"
/// gst_no : "test7737"
/// fssai : "hzhsi8873"
/// store_name : "refferal 2"
/// band_details : "{\"UPI\" : \"test@upi\"}"
/// city_id : "0"
/// vehicle_no : ""
/// registarion_card : ""
/// driving_license : ""
/// categories_id : ""
/// company_name : ""
/// role_user : ""
/// event : ""
/// latitude : "22.7468837"
/// longitude : "75.8980128"
/// delivery_type : ""
/// refferal_code : "SOD449690"
/// friend_code : "SOD542821"
/// online_status : "1"
/// store_description : "test"
/// commision : ""
/// resto_type : "Veg"
/// gender : null
/// cash_collection : "0"
/// commision_amount_type : ""
/// adhar_back : "6468ab6fb82df.jpg"
/// rc_book_back : ""
/// driving_license_back : ""
/// fssai_image : "6468ab6fe70c7.jpg"
/// gst_image : ""
/// refferal_date : "2023-05-20 16:43:53"

class Data {
  Data({
      String? id, 
      String? userId, 
      String? userType, 
      String? amount, 
      String? transactionId, 
      String? createdAt, 
      String? updatedAt, 
      String? refferalStatus, 
      String? level, 
      String? refferalId, 
      String? status, 
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
      String? wallet, 
      String? balance, 
      dynamic lastLogin, 
      String? roll, 
      String? adharCard, 
      String? pancard, 
      String? gstNo, 
      String? fssai, 
      String? storeName, 
      String? bandDetails, 
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
      String? refferalDate,}){
    _id = id;
    _userId = userId;
    _userType = userType;
    _amount = amount;
    _transactionId = transactionId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _refferalStatus = refferalStatus;
    _level = level;
    _refferalId = refferalId;
    _status = status;
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
    _wallet = wallet;
    _balance = balance;
    _lastLogin = lastLogin;
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
    _refferalDate = refferalDate;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _userType = json['user_type'];
    _amount = json['amount'];
    _transactionId = json['transaction_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _refferalStatus = json['refferal_status'];
    _level = json['level'];
    _refferalId = json['refferal_id'];
    _status = json['status'];
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
    _wallet = json['wallet'];
    _balance = json['balance'];
    _lastLogin = json['last_login'];
    _roll = json['roll'];
    _adharCard = json['adhar_card'];
    _pancard = json['pancard'];
    _gstNo = json['gst_no'];
    _fssai = json['fssai'];
    _storeName = json['store_name'];
    _bandDetails = json['band_details'];
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
    _refferalDate = json['refferal_date'];
  }
  String? _id;
  String? _userId;
  String? _userType;
  String? _amount;
  String? _transactionId;
  String? _createdAt;
  String? _updatedAt;
  String? _refferalStatus;
  String? _level;
  String? _refferalId;
  String? _status;
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
  String? _wallet;
  String? _balance;
  dynamic _lastLogin;
  String? _roll;
  String? _adharCard;
  String? _pancard;
  String? _gstNo;
  String? _fssai;
  String? _storeName;
  String? _bandDetails;
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
  String? _refferalDate;
Data copyWith({  String? id,
  String? userId,
  String? userType,
  String? amount,
  String? transactionId,
  String? createdAt,
  String? updatedAt,
  String? refferalStatus,
  String? level,
  String? refferalId,
  String? status,
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
  String? wallet,
  String? balance,
  dynamic lastLogin,
  String? roll,
  String? adharCard,
  String? pancard,
  String? gstNo,
  String? fssai,
  String? storeName,
  String? bandDetails,
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
  String? refferalDate,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  userType: userType ?? _userType,
  amount: amount ?? _amount,
  transactionId: transactionId ?? _transactionId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  refferalStatus: refferalStatus ?? _refferalStatus,
  level: level ?? _level,
  refferalId: refferalId ?? _refferalId,
  status: status ?? _status,
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
  wallet: wallet ?? _wallet,
  balance: balance ?? _balance,
  lastLogin: lastLogin ?? _lastLogin,
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
  refferalDate: refferalDate ?? _refferalDate,
);
  String? get id => _id;
  String? get userId => _userId;
  String? get userType => _userType;
  String? get amount => _amount;
  String? get transactionId => _transactionId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get refferalStatus => _refferalStatus;
  String? get level => _level;
  String? get refferalId => _refferalId;
  String? get status => _status;
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
  String? get wallet => _wallet;
  String? get balance => _balance;
  dynamic get lastLogin => _lastLogin;
  String? get roll => _roll;
  String? get adharCard => _adharCard;
  String? get pancard => _pancard;
  String? get gstNo => _gstNo;
  String? get fssai => _fssai;
  String? get storeName => _storeName;
  String? get bandDetails => _bandDetails;
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
  String? get refferalDate => _refferalDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['user_type'] = _userType;
    map['amount'] = _amount;
    map['transaction_id'] = _transactionId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['refferal_status'] = _refferalStatus;
    map['level'] = _level;
    map['refferal_id'] = _refferalId;
    map['status'] = _status;
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
    map['wallet'] = _wallet;
    map['balance'] = _balance;
    map['last_login'] = _lastLogin;
    map['roll'] = _roll;
    map['adhar_card'] = _adharCard;
    map['pancard'] = _pancard;
    map['gst_no'] = _gstNo;
    map['fssai'] = _fssai;
    map['store_name'] = _storeName;
    map['band_details'] = _bandDetails;
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
    map['refferal_date'] = _refferalDate;
    return map;
  }

}