import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_messenger/ProfilePage.dart';
import 'package:project_messenger/chatbox.dart';
import 'package:project_messenger/mapspage.dart';
import 'package:project_messenger/searchpage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_messenger/uploadImage.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({super.key});

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  
  
  List<BottomNavigationBarItem> bottomBarItem() {
    return [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home_filled,
            color: Colors.blue[400],
            size: 30,
          ),
          // backgroundColor: Colors.blue,
          label: ("Home")),
      BottomNavigationBarItem(
          icon: InkWell(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (cnxt) {
              return SearchPage();
            })),
            child: Icon(
              Icons.search,
              color: CupertinoColors.systemBlue,
              size: 30,
            ),
          ),
          //  backgroundColor: Colors.blue,
          label: ("Search")),
      BottomNavigationBarItem(
          icon: InkWell(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (cnxt) {
              return const ProfilePage();
            })),
            child: Icon(
              Icons.person,
              color: CupertinoColors.systemBlue,
              size: 30,
            ),
          ),
          //  backgroundColor: Colors.black,
          label: ("Profile"),
          backgroundColor: Colors.blue),
      BottomNavigationBarItem(
          icon: InkWell(
              onTap: () => UploadImage(),
              child: Icon(
                Icons.add_photo_alternate_rounded,
                color: CupertinoColors.systemBlue,
                size: 30,
              )),
          //  backgroundColor: Colors.blue,
          label: "Upload"),
    ];
  }

  var _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Text(
          "Messenger",
          style: GoogleFonts.amarante(
              textStyle: const TextStyle(
                  color: CupertinoColors.systemBlue,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    // _PickImageFromCamera();
                  },
                  icon: Icon(
                    Icons.camera_alt,
                    color: CupertinoColors.systemBlue,
                    size: 30,
                    // weight: 30,
                  )),
              SizedBox(width: 5),
              IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (cnxt) {
                      return ChatBox();
                    }));
                  },
                  icon: Icon(
                    Icons.near_me,
                    color: CupertinoColors.systemBlue,
                    size: 30,
                    // weight: 30,
                  )),
              SizedBox(
                width: 5,
              )
            ],
          )
        ],
      ),
      body: ListView.separated(
          itemBuilder: (_, i) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  image: NetworkImage(
                      "firebasestorage.googleapis.com/v0/b/messenger-3221b.appspot.com/o/IMG_3797.HEIC?alt=media&token=6798e661-951b-409c-b141-204be256d431"),
                  // "https://firebasestorage.googleapis.com/v0/b/messenger-3221b.appspot.com/o/IMG_3517.HEIC?alt=media&token=b9652d03-3ef2-4d12-a024-b8b7a571fcdb"
                ),
              ),
              height: 450,
            );
          },
          separatorBuilder: (_, __) {
            return SizedBox(
                height: 50,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          color: CupertinoColors.systemRed,
                          size: 30,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.mode_comment_rounded,
                      color: CupertinoColors.systemBlue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.share_outlined,
                      color: CupertinoColors.systemBlue,
                    ),
                    Expanded(child: SizedBox()),
                    Icon(
                      Icons.download,
                      color: CupertinoColors.systemBlue,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ));
          },
          itemCount: 5),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomBarItem(),
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
      ),
    );
  }

  
}
