import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageTest {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String message;
  final Timestamp timestamp;

  MessageTest( {
    required this.senderId,
    required this.senderEmail,
    required this.receiverId,
    required this.message,
    required this.timestamp,
  });
  //convert to a map or json
Map<String, dynamic> toMap(){
  return {
    'senderId':senderId,
    'senderEmail':senderEmail,
    'receiverId':receiverId,
    'message':message,
    'timestamp':timestamp,
  };
}
}
