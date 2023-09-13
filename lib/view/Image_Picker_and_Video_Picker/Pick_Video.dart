import 'dart:io';

import 'package:calendar/Rounder_Button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class PickerVideoScreen extends StatefulWidget {
  const PickerVideoScreen({super.key});

  @override
  State<PickerVideoScreen> createState() => _PickerVideoScreenState();
}

class _PickerVideoScreenState extends State<PickerVideoScreen> {
  File? video;
  VideoPlayerController? videocontroller;
  Future<void> pickvideofromgallery() async {
    final videopicked =
        await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (videopicked != null) {
      video = File(videopicked.path);
      videocontroller = VideoPlayerController.file(video!)
        ..initialize().then((_) {
          setState(() {});
          videocontroller!.play();
          videocontroller!.setLooping(true);
        });
    }
  }

  Future<void> pickvideofromcamera() async {
    final videopicked = await ImagePicker().pickVideo(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.rear,
        maxDuration: const Duration(seconds: 60));
    if (videopicked != null) {
      video = File(videopicked.path);
      videocontroller = VideoPlayerController.file(video!)
        ..initialize().then((_) {
          setState(() {});
          videocontroller!.play();
          videocontroller!.setLooping(true);
        });
    }
  }

  @override
  void dispose() {
    videocontroller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Picker Video"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            video == null
                ? const SizedBox(
                    height: 400,
                    width: 300,
                    child: Placeholder(),
                  )
                : ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxHeight: 400, maxWidth: 300),
                    child: AspectRatio(
                      aspectRatio: videocontroller!.value.aspectRatio,
                      child: Stack(
                        children: [
                          VideoPlayer(videocontroller!),
                          Center(
                            child: videocontroller!.value.isPlaying
                                ? const SizedBox()
                                : SizedBox.square(
                                    dimension: 100,
                                    child: Image.asset(
                                        "assets/icons/play-button.png"),
                                  ),
                          )
                        ],
                      ),
                    ),
                  ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: RounderButton(
                  title: "Picker Video", Press: () => pickvideofromgallery()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: RounderButton(
                  title: "Record video", Press: () => pickvideofromcamera()),
            ),
          ],
        ),
      ),
    );
  }
}
