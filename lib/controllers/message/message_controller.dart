import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deledocdoctor/models/message_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ChatingController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  // Send message
  Future<void> sendMessage(String receiverId, String message) async {
    final currentUserId = _auth.currentUser!.uid;
    final currentuserEmail = _auth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();
    final  idtime=Timestamp.now().microsecondsSinceEpoch;
      List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatroomId = ids.join("_");

    Message newMessage = Message(
        messageId:"$chatroomId""_$idtime",
        newMessage: true,
        senderId: currentUserId,
        senderEmail: currentuserEmail,
        receverId: receiverId,
        message: message,
        timestamp: timestamp);

  

      await _fireStore
          .collection("chat_rooms")
          .doc(chatroomId)
          .collection("messages")
          .doc("$chatroomId""_$idtime"). set(newMessage.toMap());
  }

  // Get messages
  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return _fireStore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }

  // Get last message
  Future<DocumentSnapshot?> getLastMessage(
      String userId, String otherUserId) async {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    QuerySnapshot snapshot = await _fireStore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timestamp", descending: true)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.first;
    }
    return null;
  }
}
