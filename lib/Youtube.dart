import 'package:calendar/Internationalization_Screen.dart';
import 'package:calendar/Rounder_Button.dart';
import 'package:calendar/picker_multiple_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeScreen extends StatefulWidget {
  const YoutubeScreen({super.key});
  @override
  State<YoutubeScreen> createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    // TODO: implement initState
    const url = "https://www.youtube.com/watch?v=XJ6fWxF_3as";
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
          mute: false, loop: false, autoPlay: true, hideControls: false),
    )..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });

    super.initState();
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool clickLike = false;
  @override
  Widget build(BuildContext context) => YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: controller,
      ),
      builder: (context, player) => Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Youtube Player',
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: ListView(
              children: [
                player,
                const SizedBox(
                  height: 16,
                ),
                Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: RounderButton(
                          title: (clickLike == true)
                              ? 'play_video'.tr
                              : 'stop_video'.tr,
                          Press: () {
                            setState(() {
                              clickLike = !clickLike;
                            });
                            if (controller.value.isPlaying) {
                              controller.pause();
                            } else {
                              controller.play();
                            }
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: RounderButton(
                          title: 'more'.tr,
                          Press: () {
                            controller.mute();
                            controller.unMute();
                            controller.seekTo(const Duration(seconds: 10));
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: RounderButton(
                          title: 'next_video'.tr,
                          Press: () {
                            const url =
                                "https://www.youtube.com/watch?v=sTiwIHOR3ow&list=RDsTiwIHOR3ow&start_radio=1";
                            controller.load(YoutubePlayer.convertUrlToId(url)!);
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: RounderButton(
                          title: 'Picker Multiple',
                          Press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PickerMultipleScreen()));
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: RounderButton(
                          title: 'app_title'.tr,
                          Press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const InternationalizationScreen()));
                          },
                        )),
                  ],
                )
              ],
            ),
          ));
}
