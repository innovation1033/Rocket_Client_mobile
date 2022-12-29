class CalculateProductsModel {
  int? carId;
  List<CalculateProducts>? calculateProducts;
  int? startAreaId;
  int? endAreaId;
  int? breakable;

  CalculateProductsModel(
      { this.carId,
        this.calculateProducts,
        this.startAreaId,
        this.endAreaId,
        this.breakable});

  CalculateProductsModel.fromJson(Map<String, dynamic> json) {
    carId = json['car_id'];
    if (json['calculate_products'] != null) {
      calculateProducts = <CalculateProducts>[];
      json['calculate_products'].forEach((v) {
        calculateProducts!.add(new CalculateProducts.fromJson(v));
      });
    }
    startAreaId = json['start_area_id'];
    endAreaId = json['end_area_id'];
    breakable = json['breakable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['car_id'] = this.carId;
    if (this.calculateProducts != null) {
      data['calculate_products'] =
          this.calculateProducts!.map((v) => v.toJson()).toList();
    }
    data['start_area_id'] = this.startAreaId;
    data['end_area_id'] = this.endAreaId;
    data['breakable'] = this.breakable;
    return data;
  }
}

class CalculateProducts {
  String? nameProduct;
  int? height;
  int? width;
  int? length;
  int? count;

  CalculateProducts(
      {this.nameProduct, this.height, this.width, this.length, this.count});

  CalculateProducts.fromJson(Map<String, dynamic> json) {
    nameProduct = json['name_product'];
    height = json['height'];
    width = json['width'];
    length = json['length'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_product'] = this.nameProduct;
    data['height'] = this.height;
    data['width'] = this.width;
    data['length'] = this.length;
    data['count'] = this.count;
    return data;
  }
}
