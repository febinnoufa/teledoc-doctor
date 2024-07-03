import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderEmail;
  final String receverId;
  final String message;
  final Timestamp timestamp;
  final bool newMessage;
  final String messageId;

  Message({
    required this.newMessage,
    required this.messageId,
    required this.senderId,
    required this.senderEmail,
    required this.receverId,
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'messageId':messageId,
      'newMessage':newMessage,
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receverId': receverId,
      'message': message,
      'timestamp': timestamp
    };
  }
}
