import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorApplicationModel {
  String? id;
  String? name;
  String? place;
  String? email;
  int? phonenumber;
  String? password;
  String? profile;
  String? genter;
  String? specialist;
  String? bio;
  String? licensenumber;
  String? experience;
  String? experiencecirtificate;
  String? licenseimage;

  DoctorApplicationModel(
      {this.id,
      this.name,
      this.place,
      this.email,
      this.phonenumber,
      this.profile,
      this.genter,
      this.password,
      this.specialist,
      this.bio,
      this.licensenumber,
      this.experience,
      this.experiencecirtificate,
      this.licenseimage});

  factory DoctorApplicationModel.fromMap(DocumentSnapshot map) {
    return DoctorApplicationModel(
      id: map.id,
      name: map["name"],
      place: map["place"],
      email: map["email"],
      phonenumber: map["phonenumber"],
      profile: map["profile"],
      genter: map["genter"],
      password: map["password"],
      specialist: map["specialist"],
      bio: map["bio"],
      licensenumber: map["licensenumber"],
      experience: map["experience"],
      licenseimage: map["licenseimage"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "place": place,
      "email": email,
      "phonenumber": phonenumber,
      "profile": profile,
      "genter": genter,
      "specialist": specialist,
      "bio": bio,
      "password":password,
      "licensenumber": licensenumber,
      "experience": experience,
      "licenseimage": licenseimage
    };
  }
}
