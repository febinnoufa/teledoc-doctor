class DoctorModel {
  final String bio;
  final String email;
  final String experience;
  final String licensenumber;
  final String genter;
  final String name;
  final int phonenumber;
  final String place;
  final String profile;
  final String licenseimage;
  final String specialist;
  final String password;

  DoctorModel({
    required this.bio,
    required this.email,
    required this.experience,
    required this.licensenumber,
    required this.genter,
    required this.name,
    required this.phonenumber,
    required this.place,
    required this.profile,
    required this.licenseimage,
    required this.specialist,
    required this.password,
  });

  factory DoctorModel.fromDocumentSnapshot(doc) {
    return DoctorModel(
      bio: doc['bio'],
      email: doc['email'],
      experience: doc['experience'],
      licensenumber: doc['licensenumber'],
      genter: doc['genter'],
      name: doc['name'],
      phonenumber: doc['phonenumber'],
      place: doc['place'],
      profile: doc['profile'],
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
      'genter': genter,
      'name': name,
      'phonenumber': phonenumber,
      'place': place,
      'profile': profile,
      'licenseimage': licenseimage,
      'specialist': specialist,
      'password': password,
    };
  }
}
