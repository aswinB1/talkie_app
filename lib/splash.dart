import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_messenger/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Duration(milliseconds: 4); () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (cnxt) {
        return OpeningPage();
      }));
    };
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Center(
        child: Image(
            fit: BoxFit.fill,
            image: NetworkImage(
                "https://www.iconsdb.com/icons/preview/black/messenger-xxl.png")),
      )),
    );
  }
}
