
class UserModel {
  String? firstname;
  String? lastdname;
  String? email;
  String? place;
  String? profile;
  String? address;
  int? age;
  int? phonenumber;
  String? password;

  UserModel({
    this.firstname,
    this.lastdname,
    this.email,
    this.place,
    this.profile,
    this.address,
    this.age,
    this.phonenumber,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstname': firstname,
      'lastdname': lastdname,
      'email': email,
      'place': place,
      'profile': profile,
      'address': address,
      'age': age,
      'phonenumber': phonenumber,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstname: map['firstname'],
      lastdname: map['lastdname'],
      email: map['email'],
      place: map['place'],
      profile: map['profile'],
      address: map['address'],
      age: map['age'],
      phonenumber: map['phonenumber'],
      password: map['password'],
    );
  }
}