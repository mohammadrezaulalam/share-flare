import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/message_model.dart';
import '../utilities/assets_path.dart';
import '../utilities/colors.dart';
import '../utilities/theme/theme.dart';
import '../widgets/bottom_rectangular_image.dart';

TextEditingController userMessage = TextEditingController();

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.userName, required this.image});

  // final User user;
  final String userName;
  final String image;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      constraints: BoxConstraints(
        minWidth: 0,
        // maxWidth: MediaQuery.of(context).size.width * 0.75,
        maxWidth: MediaQuery.of(context).size.width * 0.75,
      ),
      margin: isMe
          ? const EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: 65,
              right: 15,
            )
          : const EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: 15,
              // right: 80,
            ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        /* color: isMe
            ? const Color.fromARGB(255, 32, 160, 144)
            : const Color.fromARGB(255, 242, 247, 251),*/
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            message.text,
            style: TextStyle(
              color: isMe ? Colors.white : Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );

    if (isMe) {
      return msg;
    }
    return Row(
      children: [
        msg,
        //button for favorite icon
        !isMe
            ? IconButton(
                onPressed: () {
                  message.isLiked = !message.isLiked;
                  print(' is like ${message.isLiked}');
                  setState(() {});
                },
                icon: message.isLiked
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border),
                color: message.isLiked ? Colors.redAccent : Colors.blueGrey,
              )
            : const Text(''),
      ],
    );
  }

//method
  _buildMessageComposer() {
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
                controller: userMessage,
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
  }

  //scroller controller for show chat latest message
  ScrollController _scrollController = ScrollController();

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
            backgroundImage: AssetImage(widget.image),
         ),
         title: Text( widget.userName),
         subtitle: const Text("Last seen 11.44 AM"),
       ),
         actions:  [
           Image.asset(SFAssetsPath.phone),

           const SizedBox(width: 10,),

           Image.asset(SFAssetsPath.videoCamera),
           const SizedBox(width: 20,),
        ],

        elevation: 0.0,

      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          /*dismiss the keyboard or remove focus when a particular action occurs,
          such as when a button is pressed, a screen is tapped, or a gesture is detected.*/
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  // color: Colors.white,
                  color: SFColors.chatScreenBackground,
                ),
                child: ListView.builder(
                  controller: _scrollController,
                  reverse: false,
                  //chat screen should display data bottom to top, that means reverse
                  padding: const EdgeInsets.only(top: 15.0),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final Message message = messages[index];
                    final bool isMe = message.sender.id == currentUser.id;
                    return Align(
                      alignment: Alignment.centerRight,
                      child: _buildMessage(message, isMe),
                    );
                  },
                ),
              ),
            ),
            //
            Container(
              color: SFColors.chatScreenBackground,
              child: Column(
                children: [
                  _buildMessageComposer(),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    color: SFColors.white,
                    height: 20,
                    child: const BottomRectangularImage(),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  void sendMessage() {
    if (userMessage.text.isNotEmpty) {
      setState(() {
        messages.add(Message(
          sender: currentUser,
          time: '${DateTime.now().hour}',
          text: userMessage.text,
          isLiked: false,
          unread: false,
        ));
        userMessage.clear();
      });

      // Schedule the scroll after the ListView has been updated
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }
}
