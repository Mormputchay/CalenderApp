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
            TextButton(
                onPressed: () {
                  var locale = const Locale('km', 'KH');
                  Get.updateLocale(locale);
                },
                child: const Text('Khmer')),
            TextButton(
                onPressed: () {
                  var locale = const Locale('en', 'US');
                  Get.updateLocale(locale);
                },
                child: const Text('English'))
          ],
        ),
      ),
    );
  }
}
