import 'package:calendar/Pick%20Video.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:open_file/open_file.dart';

import 'FilesPage.dart';

class FilePickerScreen extends StatefulWidget {
  const FilePickerScreen({super.key});
  @override
  State<FilePickerScreen> createState() => _FilePickerScreenState();
}

class _FilePickerScreenState extends State<FilePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Picker'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              MaterialButton(
                minWidth: double.maxFinite,
                height: 45,
                color: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: const Text(
                  'Pick File',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  final result = await FilePicker.platform.pickFiles(
                    allowMultiple: true,
                    type: FileType.custom,
                    allowedExtensions: ['pdf', 'mp4', 'jpg', 'png', 'dart'],
                  );
                  if (result == null) return;

                  openFiles(result.files);

                  // print("Name : ${file.name}");
                  // print("Byte : ${file.bytes}");
                  // print("Size : ${file.size}");
                  // print("Extension  : ${file.extension}");
                  // print("Path : ${file.path}");
                },
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                  minWidth: double.maxFinite,
                  height: 45,
                  color: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: const Text(
                    'lock screen',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  onPressed: () {
                    screenLock(
                      context: context,
                      correctString: '1234',
                      canCancel: false,
                    );
                  }),
              const SizedBox(height: 10),
              MaterialButton(
                  minWidth: double.maxFinite,
                  height: 45,
                  color: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: const Text(
                    'Picker Video',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PickerVideoScreen()));
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void openFiles(List<PlatformFile> files) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => FilesPage(files: files, onOpenedFile: openFile)));
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  // Future<File> saveFilePermanently(PlatformFile file) async {
  //   final appStorage = await getApplicationDocumentsDirectory();
  //   final newFile = File('${appStorage.path}/ ${file.name}');
  //   return File(file.path!).copy(newFile.path);
  // }
}
