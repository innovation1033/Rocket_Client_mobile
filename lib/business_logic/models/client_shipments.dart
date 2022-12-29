class ClientShipments {
  bool? status;
  String? errNum;
  String? msg;
  List<Shipment>? shipment;

  ClientShipments({this.status, this.errNum, this.msg, this.shipment});

  ClientShipments.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['Shipment'] != null) {
      shipment = <Shipment>[];
      json['Shipment'].forEach((v) {
        shipment!.add(new Shipment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.shipment != null) {
      data['Shipment'] = this.shipment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Shipment {
  int? id;
  String? nameShipment;
  String? description;
  int? customerCode;
  int? productPrice;
  int? discountValue;
  int? orderNumber;
  var count;
  int? shippingPrice;
  List<Representative>? representative;
  int? returnPrice;
  var weight;
  var size;
  List<MapList>? map;
  String? notes;
  var deliveryDate;
  List<String>? startMap;
  List<String>? endMap;
  int? clientId;
  int? startAreaId;
  int? endAreaId;
  int? serviceTypeId;
  int? storeId;
  int? shipmentStatusId;
  int? senderId;
  var reasonId;
  int? end;
  int? statusShipments;
  int? statusCompany;
  int? breakable;
  String? createdAt;
  String? updatedAt;
  String? totalShipment;
  String? companyShipmentPrice;
  String? representativeShipmentPrice;
  String? totalService;
  String? totalProduct;
  String? nameShipmentStatu;
  Shipment(
      {this.id,
        this.nameShipmentStatu,
        this.nameShipment,
        this.description,
        this.customerCode,
        this.productPrice,
        this.discountValue,
        this.orderNumber,
        this.count,
        this.shippingPrice,
        this.returnPrice,
        this.map,
        this.weight,
        this.size,
        this.notes,
        this.deliveryDate,
        this.startMap,
        this.endMap,
        this.clientId,
        this.startAreaId,
        this.endAreaId,
        this.serviceTypeId,
        this.storeId,
        this.shipmentStatusId,
        this.senderId,
        this.reasonId,
        this.end,
        this.statusShipments,
        this.statusCompany,
        this.breakable,
        this.createdAt,
        this.updatedAt,
        this.totalShipment,
        this.companyShipmentPrice,
        this.representativeShipmentPrice,
        this.totalService,
        this.totalProduct});

  Shipment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameShipmentStatu=json['shipmentstatu']["name"];
    nameShipment = json['name_shipment'];
    description = json['description'];
    customerCode = json['customer_code'];
    productPrice = json['product_price'];
    discountValue = json['discount_value'];
    orderNumber = json['order_number'];
    count = json['count'];
    shippingPrice = json['shipping_price'];
    returnPrice = json['return_price'];
    weight = json['weight'];
    size = json['size'];
    notes = json['notes'];
    deliveryDate = json['delivery_date'];
    startMap = json['start_map'].cast<String>();
    endMap = json['end_map'].cast<String>();
    clientId = json['client_id'];
    startAreaId = json['start_area_id'];
    endAreaId = json['end_area_id'];
    serviceTypeId = json['service_type_id'];
    storeId = json['store_id'];
    shipmentStatusId = json['shipment_status_id'];
    senderId = json['sender_id'];
    reasonId = json['reason_id'];
    end = json['end'];
    statusShipments = json['status_shipments'];
    statusCompany = json['status_company'];
    breakable = json['breakable'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    totalShipment = json['total_shipment'];
    companyShipmentPrice = json['company_shipment_price'];
    representativeShipmentPrice = json['representative_shipment_price'];
    totalService = json['total_service'];
    totalProduct = json['total_product'];
    if (json['map'] != null) {
      map = <MapList>[];
      json['map'].forEach((v) {
        map!.add(new MapList.fromJson(v));
      });
    }
    if (json['representative'] != null) {
      representative = <Representative>[];
      json['representative'].forEach((v) {
        representative!.add(new Representative.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_shipment'] = this.nameShipment;
    data['description'] = this.description;
    data['customer_code'] = this.customerCode;
    data['product_price'] = this.productPrice;
    data['discount_value'] = this.discountValue;
    data['order_number'] = this.orderNumber;
    data['count'] = this.count;
    data['shipping_price'] = this.shippingPrice;
    data['return_price'] = this.returnPrice;
    data['weight'] = this.weight;
    data['size'] = this.size;
    data['notes'] = this.notes;
    data['delivery_date'] = this.deliveryDate;
    data['start_map'] = this.startMap;
    data['end_map'] = this.endMap;
    data['client_id'] = this.clientId;
    data['start_area_id'] = this.startAreaId;
    data['end_area_id'] = this.endAreaId;
    data['service_type_id'] = this.serviceTypeId;
    data['store_id'] = this.storeId;
    data['shipment_status_id'] = this.shipmentStatusId;
    data['sender_id'] = this.senderId;
    data['reason_id'] = this.reasonId;
    data['end'] = this.end;
    data['status_shipments'] = this.statusShipments;
    data['status_company'] = this.statusCompany;
    data['breakable'] = this.breakable;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['total_shipment'] = this.totalShipment;
    data['company_shipment_price'] = this.companyShipmentPrice;
    data['representative_shipment_price'] = this.representativeShipmentPrice;
    data['total_service'] = this.totalService;
    data['total_product'] = this.totalProduct;
    return data;
  }
}

class MapList {
  var id;
  String? status;
  List<String>? distance;
  String? location;
  var representativeId;
  var shipmentId;
  String? createdAt;
  String? updatedAt;

  MapList(
      {this.id,
        this.status,
        this.distance,
        this.location,
        this.representativeId,
        this.shipmentId,
        this.createdAt,
        this.updatedAt});

  MapList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    distance = json['distance'].cast<String>();
    location = json['location'];
    representativeId = json['representative_id'];
    shipmentId = json['shipment_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['distance'] = this.distance;
    data['location'] = this.location;
    data['representative_id'] = this.representativeId;
    data['shipment_id'] = this.shipmentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Representative {
  var id;
  String? name;
  String? address;
  var cv;
  var photo;
  var faceIDCardPic;
  var backIDCardPic;
  var salary;
  var wallet;
  var commission;
  var userId;
  var cityId;
  String? createdAt;
  String? updatedAt;
  String? imagePath;
  String? licensePhotoPath;
  String? fishPhotoPath;
  String? cvPath;

  Representative(
      {this.id,
        this.name,
        this.address,
        this.cv,
        this.photo,
        this.faceIDCardPic,
        this.backIDCardPic,
        this.salary,
        this.wallet,
        this.commission,
        this.userId,
        this.cityId,
        this.createdAt,
        this.updatedAt,
        this.imagePath,
        this.licensePhotoPath,
        this.fishPhotoPath,
        this.cvPath,});

  Representative.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    cv = json['cv'];
    photo = json['photo'];
    faceIDCardPic = json['face_ID_card_pic'];
    backIDCardPic = json['back_ID_card_pic'];
    salary = json['salary'];
    wallet = json['wallet'];
    commission = json['commission'];
    userId = json['user_id'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imagePath = json['image_path'];
    licensePhotoPath = json['license_photo_path'];
    fishPhotoPath = json['fish_photo_path'];
    cvPath = json['cv_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['cv'] = this.cv;
    data['photo'] = this.photo;
    data['face_ID_card_pic'] = this.faceIDCardPic;
    data['back_ID_card_pic'] = this.backIDCardPic;
    data['salary'] = this.salary;
    data['wallet'] = this.wallet;
    data['commission'] = this.commission;
    data['user_id'] = this.userId;
    data['city_id'] = this.cityId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_path'] = this.imagePath;
    data['license_photo_path'] = this.licensePhotoPath;
    data['fish_photo_path'] = this.fishPhotoPath;
    data['cv_path'] = this.cvPath;
    return data;
  }
}


