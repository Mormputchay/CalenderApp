import 'package:calendar/Rounder_Button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'WhatApp_screen.dart';

class URLScreen extends StatefulWidget {
  const URLScreen({super.key});
  @override
  State<URLScreen> createState() => _URLScreenState();
}

class _URLScreenState extends State<URLScreen> {
  final Uri _url = Uri.parse('https://flutter.dev');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception(
        'Could not launch $_url',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text(
          'URL Launcher',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RounderButton(
                    title: "Open ULL In App",
                    Press: () async {
                      const url = "https://flutter.dev";
                      if (await canLaunch(url)) {
                        await launch(url,
                            forceSafariVC: true,
                            forceWebView: true,
                            enableJavaScript: true,
                            enableDomStorage: true,
                            webOnlyWindowName: '_self');
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RounderButton(
                    title: "Open URL in Browser",
                    Press: () async {
                      const url = "https://twitter.com/home";
                      if (await canLaunch(url)) {
                        await launch(url,
                            forceSafariVC: true,
                            forceWebView: true,
                            enableJavaScript: true,
                            enableDomStorage: true,
                            webOnlyWindowName: '_self');
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RounderButton(
                    title: "SMS",
                    Press: () async {
                      const url =
                          "https://www.messenger.com/t/5211840318941574/";
                      if (await canLaunch(url)) {
                        await launch(url,
                            forceSafariVC: true,
                            forceWebView: true,
                            enableJavaScript: true,
                            enableDomStorage: true,
                            webOnlyWindowName: '_self');
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RounderButton(
                    title: "Make phone Call/ SMS ",
                    Press: () async {
                      final Uri launchUri = Uri(
                        scheme: 'tel',
                        path: "0125467986",
                      );
                      if (await canLaunch(launchUri.toString())) {
                        await launch(launchUri.toString());
                      } else {
                        print("The action is not supported. (No Phone app)");
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RounderButton(
                    title: "Send Email",
                    Press: () async {
                      String email = 'mormputchhay2022@gmail.com';
                      String subject = "Like & Subscribe";
                      String body = "Hit the Like Button :- ) !!!";
                      String? encodeQueryParameters(
                          Map<String, String> params) {
                        return params.entries
                            .map((e) =>
                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                            .join('&');
                      }

                      final Uri emailUri = Uri(
                        scheme: "mailto",
                        path: email,
                        query: encodeQueryParameters(
                            <String, String>{'subject': subject, 'body': body}),
                      );
                      launch(emailUri.toString());
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: RounderButton(
                    title: "What Screen",
                    Press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WhatAppScreens()));
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
