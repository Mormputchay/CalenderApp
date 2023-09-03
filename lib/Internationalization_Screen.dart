import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InternationalizationScreen extends StatefulWidget {
  const InternationalizationScreen({super.key});

  @override
  State<InternationalizationScreen> createState() =>
      _InternationalizationScreenState();
}

class _InternationalizationScreenState
    extends State<InternationalizationScreen> {
  List listLanguage = [
    {
      "name": "English",
      "image": "assets/icons/english.png",
    },
    {
      "name": "Khmer",
      "image": "assets/icons/khmer.png",
    },
  ];
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app_title'.tr),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: listLanguage.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                var pObj = listLanguage[index] as Map? ?? {};
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: double.maxFinite,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.cyanAccent, width: 1)),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectIndex = index;
                          if (pObj["name"] == "English") {
                            var locale = const Locale('en', 'US');

                            Get.updateLocale(locale);
                          } else {
                            var locale = const Locale('km', 'KH');

                            Get.updateLocale(locale);
                          }
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Image.asset(
                                  pObj["image"].toString(),
                                  width: 35,
                                  height: 35,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  pObj["name"].toString(),
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: Icon(Icons.circle,
                                size: 28,
                                color: selectIndex == index
                                    ? Colors.cyanAccent
                                    : Colors.grey.withOpacity(0.3)),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
