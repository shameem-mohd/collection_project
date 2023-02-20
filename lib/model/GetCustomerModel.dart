class GetCustomerModel {
  GetCustomerModel({
    this.data,
    this.success,
    this.messages,
  });

  GetCustomerModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    success = json['success'];
    // if (json['messages'] != null) {
    //   messages = [];
    //   json['messages'].forEach((v) {
    //     messages?.add(Dynamic.fromJson(v));
    //   });
    // }
  }
  List<Data>? data;
  bool? success;
  List<dynamic>? messages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['success'] = success;
    if (messages != null) {
      map['messages'] = messages?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.inDate,
    this.name,
    this.mobile,
    this.gardianName,
    this.houseName,
    this.post,
    this.pin,
    this.bulidingComanyShop,
    this.landMark,
    this.town,
    this.whatsappNo,
    this.paymentMethod,
    this.transactionId,
    this.collectionAmount,
    this.collectionDay,
    this.addedBy,
    this.luckyWin,
    this.winnerTableId,
    this.underOfUser,
    this.status,
    this.accountId,
    this.routeId,
    this.placeId,
    this.schemeId,
    this.clusterId,
    this.branchId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    inDate = json['in_date'];
    name = json['name'];
    mobile = json['mobile'];
    gardianName = json['gardian_name'];
    houseName = json['house_name'];
    post = json['post'];
    pin = json['pin'];
    bulidingComanyShop = json['buliding_comany_shop'];
    landMark = json['land_mark'];
    town = json['town'];
    whatsappNo = json['whatsapp_no'];
    paymentMethod = json['payment_method'];
    transactionId = json['transaction_id'];
    collectionAmount = json['collection_amount'];
    collectionDay = json['collection_day'];
    addedBy = json['added_by'];
    luckyWin = json['lucky_win'];
    winnerTableId = json['winner_table_id'];
    underOfUser = json['under_of_user'];
    status = json['status'];
    accountId = json['account_id'];
    routeId = json['route_id'];
    placeId = json['place_id'];
    schemeId = json['scheme_id'];
    clusterId = json['cluster_id'];
    branchId = json['branch_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
  int? id;
  String? inDate;
  String? name;
  String? mobile;
  String? gardianName;
  String? houseName;
  String? post;
  String? pin;
  String? bulidingComanyShop;
  String? landMark;
  String? town;
  String? whatsappNo;
  String? paymentMethod;
  String? transactionId;
  String? collectionAmount;
  String? collectionDay;
  String? addedBy;
  String? luckyWin;
  int? winnerTableId;
  int? underOfUser;
  int? status;
  int? accountId;
  int? routeId;
  int? placeId;
  int? schemeId;
  int? clusterId;
  int? branchId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['in_date'] = inDate;
    map['name'] = name;
    map['mobile'] = mobile;
    map['gardian_name'] = gardianName;
    map['house_name'] = houseName;
    map['post'] = post;
    map['pin'] = pin;
    map['buliding_comany_shop'] = bulidingComanyShop;
    map['land_mark'] = landMark;
    map['town'] = town;
    map['whatsapp_no'] = whatsappNo;
    map['payment_method'] = paymentMethod;
    map['transaction_id'] = transactionId;
    map['collection_amount'] = collectionAmount;
    map['collection_day'] = collectionDay;
    map['added_by'] = addedBy;
    map['lucky_win'] = luckyWin;
    map['winner_table_id'] = winnerTableId;
    map['under_of_user'] = underOfUser;
    map['status'] = status;
    map['account_id'] = accountId;
    map['route_id'] = routeId;
    map['place_id'] = placeId;
    map['scheme_id'] = schemeId;
    map['cluster_id'] = clusterId;
    map['branch_id'] = branchId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    return map;
  }
}
