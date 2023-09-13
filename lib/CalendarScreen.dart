import 'package:calendar/Rounder_Button.dart';
import 'package:calendar/view/Image_Picker_and_Video_Picker/ImagePickerScreen.dart';
import 'package:calendar/view/Image_Picker_and_Video_Picker/Photo_View.dart';
import 'package:calendar/view/analog_clock_picker_screen.dart';
import 'package:calendar/view/link_url/Url_screen.dart';
import 'package:calendar/view/map/Google_map_view.dart';
import 'package:calendar/view/youtube/Youtube.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});
  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  bool clickChangeTheme = false;
  DateTime today = DateTime.now();
  @override
  void initState() {
    super.initState();
    intitialize();
  }

  void intitialize() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Calender',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  clickChangeTheme = !clickChangeTheme;
                });
                Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              },
              icon: clickChangeTheme
                  ? const Icon(
                      Icons.sunny,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.nightlight,
                      color: Colors.white,
                    ))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "Selected Day =${today.toString().split(" ")[0]}",
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.pink,
                  fontStyle: FontStyle.italic),
            ),
            Container(
              child: TableCalendar(
                locale: "en_US",
                rowHeight: 43,
                headerStyle: const HeaderStyle(
                    formatButtonVisible: false, titleCentered: true),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, today),
                focusedDay: today,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                onDaySelected: _onDaySelected,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: MaterialButton(
                height: 45,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                minWidth: double.maxFinite,
                color: Colors.redAccent,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const YoutubeScreen()));
                },
                child: const Text(
                  'You tube',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RounderButton(
                  title: "URL Screen",
                  Press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const URLScreen()));
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RounderButton(
                  title: "Image Picker",
                  Press: () {
                    Navigator.of(context).push(PageTransition(
                      type: PageTransitionType.size,
                      alignment: Alignment.bottomCenter,
                      // childCurrent: widget,
                      // duration: const Duration(microseconds: 600),
                      // reverseDuration: const Duration(microseconds: 600),
                      child: const ImagePickerScreen(),
                    ));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: RounderButton(
                  title: "Photo View",
                  Press: () {
                    Navigator.of(context).push(PageTransition(
                      type: PageTransitionType.rotate,
                      alignment: Alignment.topCenter,
                      // childCurrent: widget,
                      // duration: const Duration(microseconds: 600),
                      // reverseDuration: const Duration(microseconds: 600),
                      child: const PhotoView(),
                    ));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RounderButton(
                  title: "google_map".tr,
                  Press: () {
                    Navigator.of(context).push(PageTransition(
                      type: PageTransitionType.rightToLeftWithFade,
                      child: const GoogleMapView(),
                    ));
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: RounderButton(
                  title: "Analog Clock PickerScreen",
                  Press: () {
                    Navigator.of(context).push(PageTransition(
                      type: PageTransitionType.rightToLeftWithFade,
                      child: const Analog_Clock_PickerScreen(),
                    ));
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }
}
