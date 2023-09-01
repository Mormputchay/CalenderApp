import 'package:calendar/Google_map_view.dart';
import 'package:calendar/ImagePickerScreen.dart';
import 'package:calendar/Photo_View.dart';
import 'package:calendar/Rounder_Button.dart';
import 'package:calendar/Url_screen.dart';
import 'package:calendar/Youtube.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:page_transition/page_transition.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});
  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
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
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Calender',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
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
                  title: "Google Map",
                  Press: () {
                    Navigator.of(context).push(PageTransition(
                      type: PageTransitionType.rightToLeftWithFade,
                      // childCurrent: widget,
                      // duration: const Duration(microseconds: 600),
                      // reverseDuration: const Duration(microseconds: 600),
                      child: const GoogleMapView(),
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
