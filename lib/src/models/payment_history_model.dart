import 'dart:convert';

PaymentHistoryModel paymentHistoryModelFromJson(String str) => PaymentHistoryModel.fromJson(json.decode(str));

String paymentHistoryModelToJson(PaymentHistoryModel data) => json.encode(data.toJson());

class PaymentHistoryModel {
  PaymentHistoryModel({this.object, this.data, this.hasMore, this.url, this.error});

  String object;
  List<PaymentHistoryData> data;
  bool hasMore;
  String url;
  PaymentHistoryError error;

  factory PaymentHistoryModel.initial() {
    return PaymentHistoryModel(
      error: null,
      data: [],
      hasMore: false,
      object: '',
      url: '',
    );
  }

  factory PaymentHistoryModel.fromJson(Map<String, dynamic> json) => PaymentHistoryModel(
        object: json["object"] == null ? null : json["object"],
        data: json["data"] == null
            ? null
            : List<PaymentHistoryData>.from(json["data"].map((x) => PaymentHistoryData.fromJson(x))),
        hasMore: json["has_more"] == null ? null : json["has_more"],
        url: json["url"] == null ? null : json["url"],
        error: json["error"] == null ? null : json["error"],
      );

  Map<String, dynamic> toJson() => {
        "object": object == null ? null : object,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
        "has_more": hasMore == null ? null : hasMore,
        "url": url == null ? null : url,
        "error": error == null ? null : error,
      };
}

class PaymentHistoryData {
  PaymentHistoryData({
    this.id,
    this.object,
    this.amount,
    this.availableOn,
    this.created,
    this.currency,
    this.description,
    this.exchangeRate,
    this.fee,
    this.feeDetails,
    this.net,
    this.reportingCategory,
    this.source,
    this.status,
    this.type,
  });

  String id;
  Object object;
  int amount;
  int availableOn;
  int created;
  String currency;
  String description;
  double exchangeRate;
  int fee;
  List<FeeDetail> feeDetails;
  int net;
  String reportingCategory;
  String source;
  String status;
  String type;

  factory PaymentHistoryData.fromJson(Map<String, dynamic> json) => PaymentHistoryData(
        id: json["id"] == null ? null : json["id"],
        object: json["object"] == null ? null : json["object"],
        amount: json["amount"] == null ? null : json["amount"],
        availableOn: json["available_on"] == null ? null : json["available_on"],
        created: json["created"] == null ? null : json["created"],
        currency: json["currency"] == null ? null : json["currency"],
        description: json["description"] == null ? null : json["description"],
        exchangeRate: json["exchange_rate"] == null ? null : json["exchange_rate"].toDouble(),
        fee: json["fee"] == null ? null : json["fee"],
        feeDetails: json["fee_details"] == null
            ? null
            : List<FeeDetail>.from(json["fee_details"].map((x) => FeeDetail.fromJson(x))),
        net: json["net"] == null ? null : json["net"],
        reportingCategory: json["reporting_category"] == null ? null : json["reporting_category"],
        source: json["source"] == null ? null : json["source"],
        status: json["status"] == null ? null : json["status"],
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "object": object == null ? null : object,
        "amount": amount == null ? null : amount,
        "available_on": availableOn == null ? null : availableOn,
        "created": created == null ? null : created,
        "currency": currency == null ? null : currency,
        "description": description == null ? null : description,
        "exchange_rate": exchangeRate == null ? null : exchangeRate,
        "fee": fee == null ? null : fee,
        "fee_details": feeDetails == null ? null : List<dynamic>.from(feeDetails.map((x) => x.toJson())),
        "net": net == null ? null : net,
        "reporting_category": reportingCategory == null ? null : reportingCategory,
        "source": source == null ? null : source,
        "status": status == null ? null : status,
        "type": type == null ? null : type,
      };
}

class FeeDetail {
  FeeDetail({
    this.amount,
    this.application,
    this.currency,
    this.description,
    this.type,
  });

  int amount;
  dynamic application;
  String currency;
  String description;
  String type;

  factory FeeDetail.fromJson(Map<String, dynamic> json) => FeeDetail(
        amount: json["amount"] == null ? null : json["amount"],
        application: json["application"],
        currency: json["currency"] == null ? null : json["currency"],
        description: json["description"] == null ? null : json["description"],
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount == null ? null : amount,
        "application": application,
        "currency": currency == null ? null : currency,
        "description": description == null ? null : description,
        "type": type == null ? null : type,
      };
}

class PaymentHistoryError {
  final String code, docUrl, message, param, type;

  PaymentHistoryError({this.code, this.docUrl, this.message, this.param, this.type});

  factory PaymentHistoryError.fromJson(Map<String, dynamic> json) => PaymentHistoryError(
        code: json["code"] == null ? null : json["code"],
        docUrl: json["doc_url"],
        message: json["message"] == null ? null : json["message"],
        param: json["param"] == null ? null : json["param"],
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "doc_url": docUrl,
        "message": message == null ? null : message,
        "param": param == null ? null : param,
        "type": type == null ? null : type,
      };
}
