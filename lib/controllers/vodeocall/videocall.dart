import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class VideoCallController extends GetxController {
  RxList<DocumentSnapshot> videoCallData = RxList<DocumentSnapshot>();
  RxString userId = ''.obs;

  sendtoken(String name) async {
    if (userId.isEmpty) {
      print(
          "Error: userId is empty...............................................................................................");
      return;
    }

    print("userId: ............${userId.value}");

    await FirebaseFirestore.instance
        .collection('videocall')
        .doc(userId.toString())
        .set({
      'token':
          "007eJxTYGhdek/0s2Kn94X4Ug8H1nVFs24IZ5zLFvq0rm+LXNfkmw8VGBKTDMwsDJNT0wxMEk1MUwwsLFPSzFNSzFMNkpMMTUxSrj5vSWsIZGRYrWnAzMgAgSA+K0NJanGJCQMDAMdIIT4=${userId.value}",
      'receveId': userId.toString(),
      'receveName': name,
      'timestamp': Timestamp.now(),
      'userId': FirebaseAuth.instance.currentUser!.uid,
      'userName': FirebaseAuth.instance.currentUser!.email!.split('@').first
    });
  }


  Future<void> deleteDoc() async {
    if (userId.isEmpty) {
      print("Error: userId is empty");
      return;
    }

    print("Deleting document for userId: $userId");

    await FirebaseFirestore.instance
        .collection('videocall')
        .doc(userId.toString())
        .delete();
  }
}


