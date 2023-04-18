class OtpVerify {
  String? status;
  String? requestedAt;
  Data? data;

  OtpVerify({this.status, this.requestedAt, this.data});

  OtpVerify.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    requestedAt = json['requestedAt'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['requestedAt'] = requestedAt;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  bool? oTPIsValid;
  String? message;
  String? loginToken;
  User? user;
  List<Entities>? entities;

  Data(
      {this.oTPIsValid,
        this.message,
        this.loginToken,
        this.user,
        this.entities});

  Data.fromJson(Map<String, dynamic> json) {
    oTPIsValid = json['OTP_isValid'];
    message = json['message'];
    loginToken = json['loginToken'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['entities'] != null) {
      entities = <Entities>[];
      json['entities'].forEach((v) {
        entities!.add(Entities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['OTP_isValid'] = oTPIsValid;
    data['message'] = message;
    data['loginToken'] = loginToken;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (entities != null) {
      data['entities'] = entities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? phone;
  String? email;
  String? privilege;
  bool? verified;
  String? createdAt;
  String? fcmRegistrationToken;

  User(
      {this.sId,
        this.name,
        this.phone,
        this.email,
        this.privilege,
        this.verified,
        this.createdAt,
        this.fcmRegistrationToken});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    privilege = json['privilege'];
    verified = json['verified'];
    createdAt = json['createdAt'];
    fcmRegistrationToken = json['fcmRegistrationToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['privilege'] = privilege;
    data['verified'] = verified;
    data['createdAt'] = createdAt;
    data['fcmRegistrationToken'] = fcmRegistrationToken;
    return data;
  }
}

class Entities {
  String? sId;
  String? name;
  String? gst;
  String? phone;
  String? station;
  String? address;
  String? createdAt;
  String? updatedAt;
  String? id;

  Entities(
      {this.sId,
        this.name,
        this.gst,
        this.phone,
        this.station,
        this.address,
        this.createdAt,
        this.updatedAt,
        this.id});

  Entities.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    gst = json['gst'];
    phone = json['phone'];
    station = json['station'];
    address = json['address'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['gst'] = gst;
    data['phone'] = phone;
    data['station'] = station;
    data['address'] = address;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['id'] = id;
    return data;
  }
}
