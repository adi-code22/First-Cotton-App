class DashboardApiResponse {
  String? status;
  String? requestedAt;
  Data? data;

  DashboardApiResponse({this.status, this.requestedAt, this.data});

  DashboardApiResponse.fromJson(Map<String, dynamic> json) {
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
  int? bales;
  int? participants;
  List<Prices>? prices;
  List<IcePrice>? icePrice;
  List<McxPrice>? mcxPrice;

  Data(
      {this.bales,
      this.participants,
      this.prices,
      this.icePrice,
      this.mcxPrice});

  Data.fromJson(Map<String, dynamic> json) {
    bales = json['bales'];
    participants = json['participants'];
    if (json['prices'] != null) {
      prices = <Prices>[];
      json['prices'].forEach((v) {
        prices!.add(Prices.fromJson(v));
      });
    }
    if (json['icePrice'] != null) {
      icePrice = <IcePrice>[];
      json['icePrice'].forEach((v) {
        icePrice!.add(IcePrice.fromJson(v));
      });
    }
    if (json['mcxPrice'] != null) {
      mcxPrice = <McxPrice>[];
      json['mcxPrice'].forEach((v) {
        mcxPrice!.add(McxPrice.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bales'] = bales;
    data['participants'] = participants;
    if (prices != null) {
      data['prices'] = prices!.map((v) => v.toJson()).toList();
    }
    if (icePrice != null) {
      data['icePrice'] = icePrice!.map((v) => v.toJson()).toList();
    }
    if (mcxPrice != null) {
      data['mcxPrice'] = mcxPrice!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Prices {
  String? groupName;
  int? numOfItems;
  List<Items>? items;

  Prices({this.groupName, this.numOfItems, this.items});

  Prices.fromJson(Map<String, dynamic> json) {
    groupName = json['groupName'];
    numOfItems = json['numOfItems'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['groupName'] = groupName;
    data['numOfItems'] = numOfItems;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? sId;
  String? date;
  String? growth;
  String? gradeStandard;
  String? grade;
  String? staple;
  String? micronaire;
  double? gravimetricTrashPercent;
  int? strengthGPT;
  Null? perQuintalPrev;
  Null? perCandyPrev;
  int? perQuintalCurr;
  int? perCandyCurr;

  Items(
      {this.sId,
      this.date,
      this.growth,
      this.gradeStandard,
      this.grade,
      this.staple,
      this.micronaire,
      this.gravimetricTrashPercent,
      this.strengthGPT,
      this.perQuintalPrev,
      this.perCandyPrev,
      this.perQuintalCurr,
      this.perCandyCurr});

  Items.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    date = json['date'];
    growth = json['growth'];
    gradeStandard = json['gradeStandard'];
    grade = json['grade'];
    staple = json['staple'];
    micronaire = json['micronaire'];
    gravimetricTrashPercent = json['gravimetricTrashPercent'].toDouble();
    strengthGPT = json['strengthGPT'];
    perQuintalPrev = json['perQuintalPrev'];
    perCandyPrev = json['perCandyPrev'];
    perQuintalCurr = json['perQuintalCurr'];
    perCandyCurr = json['perCandyCurr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['date'] = date;
    data['growth'] = growth;
    data['gradeStandard'] = gradeStandard;
    data['grade'] = grade;
    data['staple'] = staple;
    data['micronaire'] = micronaire;
    data['gravimetricTrashPercent'] = gravimetricTrashPercent;
    data['strengthGPT'] = strengthGPT;
    data['perQuintalPrev'] = perQuintalPrev;
    data['perCandyPrev'] = perCandyPrev;
    data['perQuintalCurr'] = perQuintalCurr;
    data['perCandyCurr'] = perCandyCurr;
    return data;
  }
}

class IcePrice {
  String? sId;
  String? date;
  String? contract;
  // dynamic lastPrice;
  // double? changeInPercent;
  int? volume;
  String? createdAt;

  IcePrice(
      {this.sId,
      this.date,
      this.contract,
      // this.lastPrice,
      // this.changeInPercent,
      this.volume,
      this.createdAt});

  IcePrice.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    date = json['date'];
    contract = json['contract'];
    // lastPrice = json['lastPrice'];
    // changeInPercent = json['changeInPercent'];
    volume = json['volume'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['date'] = date;
    data['contract'] = contract;
    // data['lastPrice'] = lastPrice;
    // data['changeInPercent'] = changeInPercent;
    data['volume'] = volume;
    data['createdAt'] = createdAt;
    return data;
  }
}

class McxPrice {
  String? sId;
  String? date;
  int? price;
  // double? moveInPercent;
  int? moveInPoints;
  String? createdAt;

  McxPrice(
      {this.sId,
      this.date,
      this.price,
      // this.moveInPercent,
      this.moveInPoints,
      this.createdAt});

  McxPrice.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    date = json['date'];
    price = json['price'];
    // moveInPercent = json['moveInPercent'].toDouble();
    moveInPoints = json['moveInPoints'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['date'] = date;
    data['price'] = price;
    // data['moveInPercent'] = moveInPercent;
    data['moveInPoints'] = moveInPoints;
    data['createdAt'] = createdAt;
    return data;
  }
}
