import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickerMultipleScreen extends StatefulWidget {
  const PickerMultipleScreen({super.key});
  @override
  State<PickerMultipleScreen> createState() => _PickerMultipleScreenState();
}

class _PickerMultipleScreenState extends State<PickerMultipleScreen> {
  final ImagePicker picker = ImagePicker();
  List<File> lstImagePreview = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Picker Multiple'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          lstImagePreview.isNotEmpty
              ? Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return Image.file(
                        lstImagePreview[index],
                        fit: BoxFit.contain,
                      );
                    },
                    itemCount: lstImagePreview.length,
                  ),
                )
              : Container(
                  width: MediaQuery.of(context).size.height,
                  height: MediaQuery.of(context).size.width,
                  child: const Center(child: Text("No Image Selected")),
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          List<XFile>? listImage = await picker.pickMultiImage();
          if (listImage.length > 0) {
            for (var img in listImage) {
              lstImagePreview.add(File(img.path));
            }
            setState(() {});
          }
        },
        child: const Icon(Icons.upload),
      ),
    );
  }
}
