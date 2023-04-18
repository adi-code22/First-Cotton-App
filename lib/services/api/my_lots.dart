class MyLotsApi {
  String? status;
  String? requestedAt;
  List<Lots>? lots;

  MyLotsApi({this.status, this.requestedAt, this.lots});

  MyLotsApi.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    requestedAt = json['requestedAt'];
    if (json['lots'] != null) {
      lots = <Lots>[];
      json['lots'].forEach((v) {
        lots!.add(Lots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['requestedAt'] = requestedAt;
    if (lots != null) {
      data['lots'] = lots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lots {
  String? sId;
  String? entityName;
  int? lotNumber;
  bool? bci;
  String? lotWeightEstimate;
  String? listingStatus;
  int? startSerialNo;
  int? endSerialNo;
  int? numOfBales;
  int? numTests;
  double? avgUhml;
  double? avgMic;
  double? avgGtex;
  double? avgColorRd;
  double? avgColorB;
  double? avgElong;
  double? avgUi;
  double? avgTrash;
  double? avgMoisture;
  double? avgSfi;

  Lots(
      {this.sId,
      this.entityName,
      this.lotNumber,
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

  Lots.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    entityName = json['entityName'];
    lotNumber = json['lotNumber'];
    bci = json['bci'];
    lotWeightEstimate = json['lotWeightEstimate'];
    listingStatus = json['listingStatus'];
    startSerialNo = json['startSerialNo'];
    endSerialNo = json['endSerialNo'];
    numOfBales = json['numOfBales'];
    numTests = json['numTests'];
    avgUhml = json['avgUhml'];
    avgMic = json['avgMic'];
    avgGtex = json['avgGtex'];
    avgColorRd = json['avgColorRd'];
    avgColorB = json['avgColorB'];
    avgElong = json['avgElong'];
    avgUi = json['avgUi'];
    avgTrash = json['avgTrash'];
    avgMoisture = json['avgMoisture'];
    avgSfi = json['avgSfi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['entityName'] = entityName;
    data['lotNumber'] = lotNumber;
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
