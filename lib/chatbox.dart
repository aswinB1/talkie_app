import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:project_messenger/mapspage.dart';
import 'package:project_messenger/models/chatUsers.dart';

class ChatBox extends StatefulWidget {
  const ChatBox({super.key});

  @override
  State<ChatBox> createState() => _ChatBoxState();
}
 class _ChatBoxState extends State<ChatBox>{
  
 
 
 List<ChatUsers> chatUsers = [
    ChatUsers(name: "Jane Russel", messageText: "Awesome Setup", imageUrl: "images/userImage1.jpeg", time: "Now"),
    ChatUsers(name: "Glady's Murphy", messageText: "That's Great", imageUrl: "images/userImage2.jpeg", time: "Yesterday"),
    ChatUsers(name: "Jorge Henry", messageText: "Hey where are you?", imageUrl: "images/userImage3.jpeg", time: "31 Mar"),
    ChatUsers(name: "Philip Fox", messageText: "Busy! Call me in 20 mins", imageUrl: "images/userImage4.jpeg", time: "28 Mar"),
    ChatUsers(name: "Debra Hawkins", messageText: "Thankyou, It's awesome", imageUrl: "images/userImage5.jpeg", time: "23 Mar"),
    ChatUsers(name: "Jacob Pena", messageText: "will update you in evening", imageUrl: "images/userImage6.jpeg", time: "17 Mar"),
    ChatUsers(name: "Andrey Jones", messageText: "Can you please share the file?", imageUrl: "images/userImage7.jpeg", time: "24 Feb"),
    ChatUsers(name: "John Wick", messageText: "How are you?", imageUrl: "images/userImage8.jpeg", time: "18 Feb"),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: CupertinoColors.white,
          title: Text(
            "Chats",
            style: TextStyle(fontSize: 30, color: CupertinoColors.systemBlue),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (cnxt) {
                    return googleMaps();
                  }));
                },
                icon: Icon(
                  Icons.map,
                  color: Colors.blue,
                ))
          ]),
    );
  }
}
