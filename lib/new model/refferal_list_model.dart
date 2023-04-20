/// response_code : "1"
/// msg : "Wallet transactions"
/// data : [{"id":"1","user_id":"6","user_type":"1","amount":"30.00","transaction_id":"Refferal Amount Transfer-30","created_at":"2023-04-07 11:56:32","updated_at":"2023-04-07 11:56:32","refferal_status":"0","level":"level 1","refferal_id":"7","status":"","uname":"piyush","mobile":"7828876951"},{"id":"3","user_id":"6","user_type":"1","amount":"30.00","transaction_id":"Refferal Amount Transfer-30","created_at":"2023-04-07 12:45:50","updated_at":"2023-04-07 12:45:50","refferal_status":"0","level":"level 1","refferal_id":"8","status":"","uname":"karan","mobile":"6378653925"},{"id":"52","user_id":"6","user_type":"1","amount":"50.00","transaction_id":"Refferal Amount Transfer-50","created_at":"2023-04-08 13:28:51","updated_at":"2023-04-08 13:28:51","refferal_status":"0","level":"level 1","refferal_id":"17","status":"","uname":"Ashish Kumar","mobile":"8824281755"},{"id":"54","user_id":"6","user_type":"1","amount":"50.00","transaction_id":"Refferal Amount Transfer-50","created_at":"2023-04-08 13:54:47","updated_at":"2023-04-08 13:54:47","refferal_status":"0","level":"level 1","refferal_id":"18","status":"","uname":"Shoyab","mobile":"8107060939"},{"id":"56","user_id":"6","user_type":"1","amount":"50.00","transaction_id":"Refferal Amount Transfer-50","created_at":"2023-04-12 13:23:34","updated_at":"2023-04-12 13:23:34","refferal_status":"0","level":"level 1","refferal_id":"23","status":"","uname":"mohan singh gurjar","mobile":"9214609372"},{"id":"58","user_id":"6","user_type":"1","amount":"50.00","transaction_id":"Refferal Amount Transfer-50","created_at":"2023-04-13 14:45:17","updated_at":"2023-04-13 14:45:17","refferal_status":"0","level":"level 1","refferal_id":"24","status":"","uname":"Cup Tea","mobile":"9636966950"}]

class RefferalListModel {
  RefferalListModel({
      String? responseCode, 
      String? msg, 
      List<Data>? data,}){
    _responseCode = responseCode;
    _msg = msg;
    _data = data;
}

  RefferalListModel.fromJson(dynamic json) {
    _responseCode = json['response_code'];
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _responseCode;
  String? _msg;
  List<Data>? _data;
RefferalListModel copyWith({  String? responseCode,
  String? msg,
  List<Data>? data,
}) => RefferalListModel(  responseCode: responseCode ?? _responseCode,
  msg: msg ?? _msg,
  data: data ?? _data,
);
  String? get responseCode => _responseCode;
  String? get msg => _msg;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response_code'] = _responseCode;
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "1"
/// user_id : "6"
/// user_type : "1"
/// amount : "30.00"
/// transaction_id : "Refferal Amount Transfer-30"
/// created_at : "2023-04-07 11:56:32"
/// updated_at : "2023-04-07 11:56:32"
/// refferal_status : "0"
/// level : "level 1"
/// refferal_id : "7"
/// status : ""
/// uname : "piyush"
/// mobile : "7828876951"

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
      String? uname, 
      String? mobile,}){
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
    _uname = uname;
    _mobile = mobile;
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
    _uname = json['uname'];
    _mobile = json['mobile'];
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
  String? _uname;
  String? _mobile;
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
  String? uname,
  String? mobile,
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
  uname: uname ?? _uname,
  mobile: mobile ?? _mobile,
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
  String? get uname => _uname;
  String? get mobile => _mobile;

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
    map['uname'] = _uname;
    map['mobile'] = _mobile;
    return map;
  }

}