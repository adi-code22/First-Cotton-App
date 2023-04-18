class SingleLotApi {
  String? status;
  String? requestedAt;
  Data? data;

  SingleLotApi({this.status, this.requestedAt, this.data});

  SingleLotApi.fromJson(Map<String, dynamic> json) {
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
  List<LotsResult>? lotsResult;

  Data({this.lotsResult});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['lotsResult'] != null) {
      lotsResult = <LotsResult>[];
      json['lotsResult'].forEach((v) {
        lotsResult!.add(LotsResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (lotsResult != null) {
      data['lotsResult'] = lotsResult!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LotsResult {
  String? sId;
  String? entityName;
  int? lotNumber;
  String? station;
  int? terms;
  dynamic askPrice;
  String? testCertificateLink;
  bool? bci;
  int? lotWeightEstimate;
  String? listingStatus;
  int? startSerialNo;
  int? endSerialNo;
  int? numOfBales;
  int? numTests;
  double? avgUhml;
  double? avgMic;
  double? avgGtex;
  int? avgColorRd;
  double? avgColorB;
  double? avgElong;
  int? avgUi;
  double? avgTrash;
  double? avgMoisture;
  double? avgSfi;

  LotsResult(
      {this.sId,
        this.entityName,
        this.lotNumber,
        this.station,
        this.terms,
        this.askPrice,
        this.testCertificateLink,
        this.bci,
        this.lotWeightEstimate,
        this.listingStatus,
        this.startSerialNo,
        this.endSerialNo,
        this.numOfBales,
        this.numTests,
        this.avgUhml,
        this.avgMic,
        this.avgGtex,
        this.avgColorRd,
        this.avgColorB,
        this.avgElong,
        this.avgUi,
        this.avgTrash,
        this.avgMoisture,
        this.avgSfi});

  LotsResult.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    entityName = json['entityName'];
    lotNumber = json['lotNumber'];
    station = json['station'];
    terms = json['terms'];
    askPrice = json['askPrice'];
    testCertificateLink = json['testCertificateLink'];
    bci = json['bci'];
    lotWeightEstimate = json['lotWeightEstimate'];
    listingStatus = json['listingStatus'];
    startSerialNo = json['startSerialNo'];
    endSerialNo = json['endSerialNo'];
    numOfBales = json['numOfBales'];
    numTests = json['numTests'];
    avgUhml = json['avgUhml'].toDouble();
    avgMic = json['avgMic'].toDouble();
    avgGtex = json['avgGtex'].toDouble();
    avgColorRd = json['avgColorRd'].toInt();
    avgColorB = json['avgColorB'].toDouble();
    avgElong = json['avgElong'].toDouble();
    avgUi = json['avgUi'].toInt();
    avgTrash = json['avgTrash'].toDouble();
    avgMoisture = json['avgMoisture'].toDouble();
    avgSfi = json['avgSfi'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['entityName'] = entityName;
    data['lotNumber'] = lotNumber;
    data['station'] = station;
    data['terms'] = terms;
    data['askPrice'] = askPrice;
    data['testCertificateLink'] = testCertificateLink;
    data['bci'] = bci;
    data['lotWeightEstimate'] = lotWeightEstimate;
    data['listingStatus'] = listingStatus;
    data['startSerialNo'] = startSerialNo;
    data['endSerialNo'] = endSerialNo;
    data['numOfBales'] = numOfBales;
    data['numTests'] = numTests;
    data['avgUhml'] = avgUhml;
    data['avgMic'] = avgMic;
    data['avgGtex'] = avgGtex;
    data['avgColorRd'] = avgColorRd;
    data['avgColorB'] = avgColorB;
    data['avgElong'] = avgElong;
    data['avgUi'] = avgUi;
    data['avgTrash'] = avgTrash;
    data['avgMoisture'] = avgMoisture;
    data['avgSfi'] = avgSfi;
    return data;
  }
}
