// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? status;
  String? token;
  UserData? data;

  UserModel({this.status, this.token, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['token'] = token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserData {
  int? iId;
  String? name;
  String? email;
  bool? isVerified;
  String? phoneNumber;
  String? personalPhoto;
  String? gender;
  String? password;
  String? nationality;
  UserData({
    this.iId,
    this.name,
    this.email,
    this.isVerified,
    this.phoneNumber,
    this.personalPhoto,
    this.gender,
    this.password,
    this.nationality,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    name = json['name'];
    email = json['email'];
    isVerified = json['isVerified'];
    phoneNumber = json['phoneNumber'];
    personalPhoto = json['personalPhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = iId;
    data['name'] = name;
    data['email'] = email;
    data['isVerified'] = isVerified;
    data['phoneNumber'] = phoneNumber;
    data['personalPhoto'] = personalPhoto;

    return data;
  }
}

class StudentModel extends UserModel {
  num? ageGroup;

  num? educationFlow;
  num? readAndListenLevel;
  StudentModel({
    this.ageGroup,
    this.educationFlow,
    this.readAndListenLevel,
  });

  //List<num>? notifications;

  StudentModel.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    ageGroup = json['ageGroup'];
    educationFlow = json['educationFlow'];
    readAndListenLevel = json['readAndListenLevel'];
  }
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ageGroup'] = ageGroup;
    data['educationFlow'] = educationFlow;
    data['readAndListenLevel'] = readAndListenLevel;

    return data;
  }
}

class TeacherModel extends UserModel {
  String? description;
  List<num>? masertyPath;
  String? novel;
  int? age;
  num? rate;
  TeacherModel({
    this.age,
    this.description,
    this.masertyPath,
    this.novel,
    this.rate,
  });

  TeacherModel.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    description = json['description'];
    masertyPath = json['masertyPath'];
    novel = json['novel'];
    age = json['age'];
    rate = json['rate'];
  }
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['masertyPath'] = masertyPath;
    data['novel'] = novel;
    data['age'] = age;
    data['rate'] = rate;

    return data;
  }
}
