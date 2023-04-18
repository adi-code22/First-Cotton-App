class RegisterApiResponse {
  String? status;
  String? requestedAt;
  Data? data;

  RegisterApiResponse({this.status, this.requestedAt, this.data});

  RegisterApiResponse.fromJson(Map<String, dynamic> json) {
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
  String? message;
  User? user;
  UserEntity? userEntity;

  Data({this.message, this.user, this.userEntity});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    userEntity = json['userEntity'] != null
        ? UserEntity.fromJson(json['userEntity'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (userEntity != null) {
      data['userEntity'] = userEntity!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? phone;
  bool? verified;
  bool? active;
  String? createdAt;
  String? updatedAt;
  String? email;
  String? name;

  User(
      {this.sId,
        this.phone,
        this.verified,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.email,
        this.name});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phone = json['phone'];
    verified = json['verified'];
    active = json['active'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    email = json['email'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['phone'] = phone;
    data['verified'] = verified;
    data['active'] = active;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['email'] = email;
    data['name'] = name;
    return data;
  }
}

class UserEntity {
  String? owner;
  String? name;
  String? gst;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserEntity(
      {this.owner,
        this.name,
        this.gst,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  UserEntity.fromJson(Map<String, dynamic> json) {
    owner = json['owner'];
    name = json['name'];
    gst = json['gst'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['owner'] = owner;
    data['name'] = name;
    data['gst'] = gst;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
