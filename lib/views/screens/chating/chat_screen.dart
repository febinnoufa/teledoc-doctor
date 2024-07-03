// chat_screen.dart (Doctor Side)
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deledocdoctor/controllers/vodeocall/videocall.dart';
import 'package:deledocdoctor/views/screens/videocall/uikit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:deledocdoctor/controllers/message/message_controller.dart';

// ignore: must_be_immutable
class ChatScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final receiverPatient;
  final name;
  final id;
  bool videocall;
  bool audiocall;

  ChatScreen(
      {super.key,
      required this.audiocall,
      required this.name,
      required this.id,
      required this.receiverPatient,
      required this.videocall});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messagecontroller = TextEditingController();
  final ChatingController chatingcontroller = Get.put(ChatingController());
  final ScrollController _scrollController = ScrollController();
  final VideoCallController videocallcontroller =
      Get.put(VideoCallController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _makePhoneCall(String number) async {
    //const number = '7012846511'; // Replace with the number you want to call
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
    if (res == null || !res) {}
  }

  @override
  void dispose() {
    AwesomeNotifications().cancelAllSchedules();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  void sendMessage() async {
    if (_messagecontroller.text.isNotEmpty) {
      await chatingcontroller.sendMessage(
          widget.id.toString(), _messagecontroller.text);
      _messagecontroller.clear();
      _scrollToBottom();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 198, 198),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text("${widget.name}"),
        centerTitle: true,
        actions: [
          widget.audiocall == true
              ? IconButton(
                  onPressed: () {
                    _makePhoneCall(widget.receiverPatient.contactNumber);
                  },
                  icon: const Icon(Icons.call))
              : const SizedBox(),
          widget.videocall == true
              ? IconButton(
                  icon: const Icon(Icons.video_call),
                  onPressed: () async {
                    await videocallcontroller.sendtoken(widget.name);
                    //    await videocallcontroller.sendtokenOnRealTIme(widget.name);
                    Get.to(VideoCallScreenUikit());
                  },
                )
              : const SizedBox()
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(child: _buildMessageList()),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return const Center(child: Text("User not logged in"));
    }

    return StreamBuilder(
      stream:
          chatingcontroller.getMessages(widget.id.toString(), currentUser.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error ${snapshot.error}");
        }
       

        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollToBottom();
        });

        if (!snapshot.hasData) {
          return const Center(child: Text("No messages"));
        }

        return ListView(
          controller: _scrollController,
          children:
              snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return const SizedBox.shrink();
    }

    bool isCurrentUser = data['senderId'] == currentUser.uid;
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (!isCurrentUser)
            const Padding(padding: EdgeInsets.only(bottom: 4.0)),
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7),
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: isCurrentUser ? Colors.blue[100] : Colors.grey[300],
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, offset: Offset(1, 2), blurRadius: 5),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Text(data['message'],
                      style: const TextStyle(color: Colors.black)),
                ),
                const SizedBox(height: 5),
                Text(
                  _formatTimestamp(data['timestamp']),
                  style: const TextStyle(color: Colors.grey, fontSize: 10.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(Timestamp timestamp) {
    DateTime date = timestamp.toDate();
    return "${date.hour}:${date.minute.toString().padLeft(2, '0')}";
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _messagecontroller,
                decoration: InputDecoration(
                  hintText: "Enter your message...",
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send, color: Colors.blue),
              onPressed: sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
