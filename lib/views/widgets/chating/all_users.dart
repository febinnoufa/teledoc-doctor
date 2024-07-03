import 'package:deledocdoctor/controllers/vodeocall/videocall.dart';
import 'package:deledocdoctor/models/users.dart';
import 'package:deledocdoctor/views/screens/chating/chat_screen.dart';
import 'package:deledocdoctor/views/widgets/shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatingAllUsers extends StatelessWidget {
  ChatingAllUsers({super.key});
  final VideoCallController videocallcontroller =
      Get.put(VideoCallController());

  Stream<List<UserModel>> streamUsersWithMessages() async* {
    String currentUserId = FirebaseAuth.instance.currentUser!.uid;
    List<UserModel> usersWithMessages = [];

    // Get all users
    var usersSnapshot =
        await FirebaseFirestore.instance.collection('users').get();
    for (var doc in usersSnapshot.docs) {
      UserModel user = UserModel.fromMap(doc.data());
      String otherUserId = user.id.toString();

      // Check if there are messages between the current user and this user
      List<String> ids = [currentUserId, otherUserId];
      ids.sort();
      String chatRoomId = ids.join("_");

      var messagesSnapshot = await FirebaseFirestore.instance
          .collection("chat_rooms")
          .doc(chatRoomId)
          .collection("messages")
          .limit(1)
          .get();

      if (messagesSnapshot.docs.isNotEmpty) {
        usersWithMessages.add(user);
      }
    }
    yield usersWithMessages;
  }

  Stream<QuerySnapshot> getLastMessageStream(
      String userId, String otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return FirebaseFirestore.instance
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timestamp", descending: true)
        .limit(1)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<UserModel>>(
        stream: streamUsersWithMessages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: ShimmerMyAppointment());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No users with messages found.'));
          } else {
            List<UserModel> users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                UserModel user = users[index];
                return StreamBuilder<QuerySnapshot?>(
                  stream: getLastMessageStream(
                    FirebaseAuth.instance.currentUser!.uid,
                    user.id.toString(),
                  ),
                  builder: (context, messageSnapshot) {
                    String lastMessage = '';
                    String lastMessageTime = '';
                    bool newMessage = false;
                    String senderId = '';
                    Map<String, dynamic> data;
                    String messageId = "";

                    if (messageSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      lastMessage = 'Loading...';
                    } else if (messageSnapshot.hasData &&
                        messageSnapshot.data!.docs.isNotEmpty) {
                      data = messageSnapshot.data!.docs.first.data()
                          as Map<String, dynamic>;
                      lastMessage = data['message'] ?? 'No message';
                      lastMessageTime = _formatTimestamp(data['timestamp']);
                      newMessage = data['newMessage'];
                      senderId = data['senderId'];
                      messageId = data['messageId'];
                    }

                    return Column(
                      children: [
                        const SizedBox(height: 5),
                        ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 60,
                            height: 70,
                            child: user.profile != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: FadeInImage.assetNetwork(
                                      placeholder: "assets/profile.png",
                                      image: user.profile.toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : const Icon(
                                    Icons.person,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                          ),
                          trailing: Text(lastMessageTime),
                          title: Text(" ${user.firstname} ${user.lastdname}"),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: newMessage == true &&
                                    senderId !=
                                        FirebaseAuth.instance.currentUser!.uid
                                ? const Text(
                                    "New Message",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )
                                : Text(lastMessage),
                          ),
                          onTap: () {
                            videocallcontroller.userId.value =
                                user.id.toString();
                            updateNewMessage(
                                FirebaseAuth.instance.currentUser!.uid,
                                user.id.toString(),
                                messageId);
                            Get.to(() => ChatScreen(
                              audiocall: false,
                              videocall: false,
                                id: user.id,
                                name: user.firstname,
                                receiverPatient: user));
                          },
                        ),
                        const SizedBox(height: 5),
                        const Divider(thickness: 2),
                      ],
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }

  updateNewMessage(String userId, String otherUserId, String messageId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return FirebaseFirestore.instance
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .doc(messageId)
        .update({'newMessage': false});
  }

  String _formatTimestamp(Timestamp timestamp) {
    DateTime date = timestamp.toDate();
    return "${date.hour}:${date.minute.toString().padLeft(2, '0')}";
  }
}
