class DoctorModel {
  final String bio;
  final String email;
  final String experience;
  final String licensenumber;
  final String gender;  // Correcting the typo from 'genter'
  final String name;
  final String phonenumber;
  final String place;
  final String profile;
  final String? experiencecertificate;  // Correcting the typo from 'experiencecirtificate'
  final String licenseimage;
  final String specialist;
  final String password;

  DoctorModel({
    required this.bio,
    required this.email,
    required this.experience,
    required this.licensenumber,
    required this.gender,
    required this.name,
    required this.phonenumber,
    required this.place,
    required this.profile,
    this.experiencecertificate,
    required this.licenseimage,
    required this.specialist,
    required this.password,
  });

  factory DoctorModel.fromDocumentSnapshot( doc) {
    return DoctorModel(
      bio: doc['bio'],
      email: doc['email'],
      experience: doc['experience'],
      licensenumber: doc['licensenumber'],
      gender: doc['gender'],
      name: doc['name'],
      phonenumber: doc['phonenumber'],
      place: doc['place'],
      profile: doc['profile'],
      experiencecertificate: doc['experiencecertificate'],
      licenseimage: doc['licenseimage'],
      specialist: doc['specialist'],
      password: doc['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bio': bio,
      'email': email,
      'experience': experience,
      'licensenumber': licensenumber,
      'gender': gender,
      'name': name,
      'phonenumber': phonenumber,
      'place': place,
      'profile': profile,
      'experiencecertificate': experiencecertificate,
      'licenseimage': licenseimage,
      'specialist': specialist,
      'password': password,
    };
  }
}
