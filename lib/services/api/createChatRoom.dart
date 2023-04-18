class CreateChatRoom {
  String? status;
  String? requestedAt;
  Data? data;

  CreateChatRoom({this.status, this.requestedAt, this.data});

  CreateChatRoom.fromJson(Map<String, dynamic> json) {
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
  Group? group;

  Data({this.group});

  Data.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? Group.fromJson(json['group']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (group != null) {
      data['group'] = group!.toJson();
    }
    return data;
  }
}

class Group {
  String? message;
  String? buyerName;
  String? buyerMobile;
  String? sellerName;
  String? sellerMobile;
  String? staffName;
  String? staffMobile;

  Group(
      {this.message,
        this.buyerName,
        this.buyerMobile,
        this.sellerName,
        this.sellerMobile,
        this.staffName,
        this.staffMobile});

  Group.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    buyerName = json['buyerName'];
    buyerMobile = json['buyerMobile'];
    sellerName = json['sellerName'];
    sellerMobile = json['sellerMobile'];
    staffName = json['staffName'];
    staffMobile = json['staffMobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['buyerName'] = buyerName;
    data['buyerMobile'] = buyerMobile;
    data['sellerName'] = sellerName;
    data['sellerMobile'] = sellerMobile;
    data['staffName'] = staffName;
    data['staffMobile'] = staffMobile;
    return data;
  }
}
