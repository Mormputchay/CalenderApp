// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';

class RounderButton extends StatelessWidget {
  const RounderButton({super.key, required this.title, required this.Press});
  final String title;
  final VoidCallback Press;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        height: 55,
        minWidth: double.maxFinite,
        color: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: Press,
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ));
  }
}
