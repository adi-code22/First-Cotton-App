class EntityResponse {
  String? status;
  String? requestedAt;
  List<Data>? data;

  EntityResponse({this.status, this.requestedAt, this.data});

  EntityResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    requestedAt = json['requestedAt'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['requestedAt'] = requestedAt;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  Owner? owner;
  String? name;
  String? gst;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
        this.owner,
        this.name,
        this.gst,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    name = json['name'];
    gst = json['gst'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    data['name'] = name;
    data['gst'] = gst;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Owner {
  String? sId;
  String? phone;
  String? email;
  String? name;

  Owner({this.sId, this.phone, this.email, this.name});

  Owner.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phone = json['phone'];
    email = json['email'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['phone'] = phone;
    data['email'] = email;
    data['name'] = name;
    return data;
  }
}
