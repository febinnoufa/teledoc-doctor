import 'package:deledocdoctor/controllers/message/message_controller.dart';
import 'package:deledocdoctor/models/users.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  final UserModel receiverUser;
  const ChatScreen({super.key, required this.receiverUser});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messagecontroller = TextEditingController();
   final ChatingController chatingcontroller = Get.put(ChatingController());
     void sendMessage() async {
    // if (_messagecontroller.text.isNotEmpty) {
    //   await chatingcontroller.sendMessage(
    //       widget.receiverUser.phonenumber, _messagecontroller.text);

    //   _messagecontroller.clear();
    // }
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}