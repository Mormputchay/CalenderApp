import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatAppScreens extends StatefulWidget {
  const WhatAppScreens({super.key});
  @override
  State<WhatAppScreens> createState() => _WhatAppScreensState();
}

class _WhatAppScreensState extends State<WhatAppScreens> {
  WhatAppScreens whatsapp = const WhatAppScreens();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Test What App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWhatApp(
              title: "What App",
              onPressed: () {
                whatApp();
              },
              color: Colors.green,
            ),
            ButtonWhatApp(
              title: "Face Book",
              onPressed: () {
                facebook();
              },
              color: Colors.blueAccent,
            ),
            ButtonWhatApp(
              title: "Call",
              onPressed: () {
                calling();
              },
              color: Colors.purple,
            ),
            ButtonWhatApp(
              title: "SMS",
              onPressed: () {
                messserge();
              },
              color: Colors.pinkAccent,
            ),
          ],
        ),
      ),
    );
  }

  calling() async {
    const url = 'tel: + 213457890';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  whatApp() async {
    const url = 'whatsapp://send?phone=092528378';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  facebook() async {
    const url = 'https://www.facebook.com/profile.php?id=100048162334547';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  messserge() async {
    const url = 'https://www.messenger.com/t/5211840318941574/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ButtonWhatApp extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPressed;
  const ButtonWhatApp({
    super.key,
    required this.title,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: MaterialButton(
        color: color,
        height: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        minWidth: double.maxFinite,
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
