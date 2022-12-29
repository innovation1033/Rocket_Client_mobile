class UserProfileModel {
  int? id;
  String? email;
  String? userName;
  var emailVerifiedAt;
  String? phoneNumber;
  int? isActive;
  String? userType;
  String? token;
  var firebaseId;
  String? createdAt;
  String? updatedAt;
  UserData? userData;

  UserProfileModel(
      {this.id,
        this.email,
        this.userName,
        this.emailVerifiedAt,
        this.phoneNumber,
        this.isActive,
        this.userType,
        this.token,
        this.firebaseId,
        this.createdAt,
        this.updatedAt,
        this.userData});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    userName = json['user_name'];
    emailVerifiedAt = json['email_verified_at'];
    phoneNumber = json['phone_number'];
    isActive = json['is_active'];
    userType = json['user_type'];
    token = json['token'];
    firebaseId = json['firebase_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['user_name'] = this.userName;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone_number'] = this.phoneNumber;
    data['is_active'] = this.isActive;
    data['user_type'] = this.userType;
    data['token'] = this.token;
    data['firebase_id'] = this.firebaseId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    return data;
  }
}

class UserData {
  int? id;
  String? name;
  String? email2;
  var address;
  String? phone;
  var phone2;
  var photo;
  var googleLocation;
  int? userId;
  int? cityId;
  var employeeId;
  String? createdAt;
  String? updatedAt;
  String? imagePath;

  UserData(
      {this.id,
        this.name,
        this.email2,
        this.address,
        this.phone,
        this.phone2,
        this.photo,
        this.googleLocation,
        this.userId,
        this.cityId,
        this.employeeId,
        this.createdAt,
        this.updatedAt,
        this.imagePath});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email2 = json['email_2'];
    address = json['address'];
    phone = json['phone'];
    phone2 = json['phone_2'];
    photo = json['photo'];
    googleLocation = json['google_location'];
    userId = json['user_id'];
    cityId = json['city_id'];
    employeeId = json['employee_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email_2'] = this.email2;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['phone_2'] = this.phone2;
    data['photo'] = this.photo;
    data['google_location'] = this.googleLocation;
    data['user_id'] = this.userId;
    data['city_id'] = this.cityId;
    data['employee_id'] = this.employeeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_path'] = this.imagePath;
    return data;
  }
}
