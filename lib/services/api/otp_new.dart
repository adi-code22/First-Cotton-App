class OtpSentApi {
  String? status;
  String? requestedAt;
  Data? data;

  OtpSentApi({this.status, this.requestedAt, this.data});

  OtpSentApi.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    requestedAt = json['requestedAt'];
    if (json['data'] != null) {
      data = Data.fromJson(json['data']);
    } else {
      data = null;
    }
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
  bool? userIsVerified;
  String? message;
  String? info;

  Data({this.userIsVerified, this.message, this.info});

  Data.fromJson(Map<String, dynamic> json) {
    userIsVerified = json['userIsVerified'];
    message = json['message'];
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userIsVerified'] = userIsVerified;
    data['message'] = message;
    data['info'] = info;
    return data;
  }
}