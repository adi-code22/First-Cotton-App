class SendFileResponse {
  String? status;
  String? requestedAt;
  Data? data;

  SendFileResponse({this.status, this.requestedAt, this.data});

  SendFileResponse.fromJson(Map<String, dynamic> json) {
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
  ChatFile? chatFile;

  Data({this.message, this.chatFile});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    chatFile = json['chatFile'] != null
        ? ChatFile.fromJson(json['chatFile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (chatFile != null) {
      data['chatFile'] = chatFile!.toJson();
    }
    return data;
  }
}

class ChatFile {
  String? user;
  String? chatFileName;
  String? chatFileType;
  String? chatFileKey;
  String? chatFileLink;

  ChatFile(
      {this.user,
        this.chatFileName,
        this.chatFileType,
        this.chatFileKey,
        this.chatFileLink});

  ChatFile.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    chatFileName = json['chatFileName'];
    chatFileType = json['chatFileType'];
    chatFileKey = json['chatFileKey'];
    chatFileLink = json['chatFileLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    data['chatFileName'] = chatFileName;
    data['chatFileType'] = chatFileType;
    data['chatFileKey'] = chatFileKey;
    data['chatFileLink'] = chatFileLink;
    return data;
  }
}
