class CarsModel {
  bool? status;
  String? errNum;
  String? msg;
  List<Car>? car;

  CarsModel({this.status, this.errNum, this.msg, this.car});

  CarsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['Car'] != null) {
      car = <Car>[];
      json['Car'].forEach((v) {
        car!.add(new Car.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.car != null) {
      data['Car'] = this.car!.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

class Car {
  int? id;
  String? name;
  String? photo;
  String? carModel;
  int? carNumber;
  int? carWeight;
  String? createdAt;
  String? updatedAt;
  String? imagePath;

  Car(
      {this.id,
        this.name,
        this.photo,
        this.carModel,
        this.carNumber,
        this.carWeight,
        this.createdAt,
        this.updatedAt,
        this.imagePath});

  Car.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['car_type'];
    photo = json['photo'];
    carModel = json['car_model'];
    carNumber = json['car_number'];
    carWeight = json['car_weight'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['car_type'] = this.name;
    data['photo'] = this.photo;
    data['car_model'] = this.carModel;
    data['car_number'] = this.carNumber;
    data['car_weight'] = this.carWeight;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_path'] = this.imagePath;
    return data;
  }
}
