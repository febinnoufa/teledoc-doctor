import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VideoCallController extends GetxController {
  RxList<DocumentSnapshot> videoCallData = RxList<DocumentSnapshot>();

   fetchVideoCallData() async {
    String currentUserUid = FirebaseAuth.instance.currentUser!.uid;
    
    // Fetch data from Firestore where doc id equals current user uid
    var snapshot = await FirebaseFirestore.instance.collection('videocall').doc(currentUserUid).get();

    if (snapshot.exists) {
      videoCallData.add(snapshot);
    }
  }
}
