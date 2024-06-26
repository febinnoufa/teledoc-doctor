import 'package:deledocdoctor/models/users.dart';
import 'package:deledocdoctor/views/screens/chating/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ChatingAllUsers extends StatelessWidget {
  const ChatingAllUsers({super.key});

  Stream<List<UserModel>> streamUsers() {
    return FirebaseFirestore.instance.collection('users').snapshots().map(
      (snapshot) {
        return snapshot.docs.map((doc) {
          return UserModel.fromMap(doc.data());
        }).toList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('All Users')),
      body: StreamBuilder<List<UserModel>>(
        stream: streamUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No users found.'));
          } else {
            List<UserModel> users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                UserModel user = users[index];
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
                        // ignore: unnecessary_null_comparison
                        child: user.profile != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  user.profile.toString(),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : const Icon(
                                Icons.person,
                                size: 40,
                                color: Colors.white,
                              ),
                      ),
                      trailing: Text("12:30"),
                      title: Text(" ${user.firstname} ${user.lastdname}"),
                      subtitle: Text("Hi"),
                      //  trailing: Text(doctor.lastMessageTime ?? 'No Time'),
                      onTap: () {
                        // Navigate to doctor details or chat screen
                        Get.to(() => ChatScreen(id: user.id,name: user.firstname,receiverPatient:users ,));
                      },
                    ),
                    const SizedBox(height: 5),
                    const Divider(thickness: 2),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
