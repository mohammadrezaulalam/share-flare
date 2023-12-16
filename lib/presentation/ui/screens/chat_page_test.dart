import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:share_flare/data/services/chat_service.dart';
import 'package:share_flare/presentation/ui/utilities/auth_constant.dart';

import '../utilities/assets_path.dart';
import '../utilities/colors.dart';
import '../utilities/theme/theme.dart';
import '../widgets/bottom_rectangular_image.dart';

class ChatPage extends StatefulWidget {
  final String reciverUserEmail;
  final String receiverUserId;
  final String firstName;
  final String lastName;
  final String image;


  const ChatPage({
    super.key,
    required this.reciverUserEmail,
    required this.receiverUserId,
    required this.firstName,
    required this.lastName, required this.image,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();

  // final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //scroller controller for show chat latest message
  ScrollController _scrollController = ScrollController();

  void sendMessage() async {
    //only send message if there is something to send
    if (_messageController.text.isNotEmpty) {
      await chatController.sendMessage(
        widget.receiverUserId,
        _messageController.text,
      );
      //clear the text controller after sending the message
      _messageController.clear();
    }
    // Schedule the scroll after the ListView has been updated
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = SFAppTheme.isDarkMode(context);
    return Scaffold(
      backgroundColor: SFColors.white,
      appBar: AppBar(
        leadingWidth: 20,
        flexibleSpace: Container(
          color: dark
              ? const Color(0xFF1D2939)
              : SFColors.white, // Set the background color explicitly
        ),

        leading:GestureDetector(
            onTap: (){
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios_new_rounded)),
        title:  ListTile(
          leading:  CircleAvatar(

              backgroundImage: NetworkImage(widget.image),
          ),
          title: Text("${widget.firstName} ${widget.lastName}"),
          // subtitle: const Text("Last seen 11.44 AM"),
        ),
        actions:  [
          Image.asset(SFAssetsPath.phone),

          const SizedBox(width: 10,),

          Image.asset(SFAssetsPath.videoCamera),
          const SizedBox(width: 20,),
        ],

        elevation: 0.0,

      ),

      /* AppBar(
        title: Text(widget.reciverUserEmail),
      ),*/
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 249, 249, 250),
        ),
        child: Column(
          children: [
            //message
            Expanded(child: _buildMessageList()),
            //user input
            _buildMessageInput(),

            const SizedBox(
              height: 10,
            ),
            Container(
              color: SFColors.white,
              height: 20,
              child: const BottomRectangularImage(),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  //build message list
  Widget _buildMessageList() {
    return StreamBuilder(
        stream: chatController.getMessage(
            widget.receiverUserId, _firebaseAuth.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading..');
          }
          return ListView(
            controller: _scrollController,
            reverse: false,
            children: snapshot.data!.docs
                .map((document) => _buildMessageItem(document))
                .toList(),
          );
        });
  }

//build message item
/*  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    //align the message to the right if the sender is the current user, otherwise to the left
    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
          mainAxisAlignment:  (data['senderId'] == _firebaseAuth.currentUser!.uid)
          ?MainAxisAlignment.end
          :MainAxisAlignment.start,
          children: [
            Text(data['senderEmail']),
            Text(data['message']),
          ],
        ),
      ),
    );
  }*/
/*  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    //align the message to the right if the sender is the current user, otherwise to the left
    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    var isMe= (data['senderId'] == _firebaseAuth.currentUser!.uid);
    return Container(

      alignment: alignment,
   padding: EdgeInsets.all(5),
    margin:  EdgeInsets.all(10),
      constraints: BoxConstraints(
        minWidth: 0,

        maxWidth: MediaQuery.of(context).size.width * 0.75,

      ),
      decoration: BoxDecoration(
        color: isMe ? SFColors.chatTextBackground : SFColors.white,
        borderRadius: isMe
            ? const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        )
            : const BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child:   Text(data['message'],style: TextStyle(fontSize: 16),),
    );
  }*/

  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    var isMe = (data['senderId'] == _firebaseAuth.currentUser!.uid);

    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(
          minWidth: 0,
          // maxWidth: MediaQuery.of(context).size.width * 0.75,
          maxWidth: MediaQuery.of(context).size.width * 0.70,
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isMe ? SFColors.chatTextBackground : SFColors.white,
          borderRadius: isMe
              ? const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                )
              : const BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
        ),
        child: Text(
          data['message'],
          style: isMe
              ? TextStyle(fontSize: 16, color: SFColors.white)
              : TextStyle(fontSize: 16, color: SFColors.black),
        ),
      ),
    );
  }

//build message input
  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 8),
        height: 50.0,
        color: SFColors.chatScreenBackground,
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextField(
                controller: _messageController,
                textCapitalization:
                    TextCapitalization.sentences, // first word of sentence
                /*decoration: const InputDecoration.collapsed(
                  //to disappear underlie form below textField, use InputDecoration.collapsed
                  hintText: 'Send a message...',
                ),*/
                decoration: InputDecoration(
                  hintText: 'Write message...',
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  fillColor: SFColors.white,
                  filled: true,

                  /*border*/
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: SFColors.white),
                      borderRadius: BorderRadius.circular(4)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: SFColors.white),
                      borderRadius: BorderRadius.circular(4)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: SFColors.white),
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  sendMessage();
                },
                icon: Container(
                  color: SFColors.buttonActiveColor,
                  padding: const EdgeInsets.all(5),
                  child: const Icon(
                    Icons.send,
                    size: 28,
                    color: SFColors.white,
                  ),
                )),
          ],
        ),
      ),
    );
    /*return Row(
      children: [
        //textfield
        Expanded(
          child: TextField(
            controller: _messageController,
            decoration: InputDecoration(hintText: 'Enter message'),
          ),
        ),
        //send button
        IconButton(
          onPressed: sendMessage,
          icon: Icon(
            Icons.arrow_upward,
            size: 40,
          ),
        ),
      ],
    );*/
  }
}
