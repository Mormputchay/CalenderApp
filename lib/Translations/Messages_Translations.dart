import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'app_title': 'Internationalization',
          'stop_video': 'Stop Video',
          'play_video': 'Play Video',
          'more': 'More',
          'next_video': 'Next Video',
          'google_map': 'Google Map'
        },
        'km_KH': {
          'app_title': 'ការបកប្រែភាសា',
          'stop_video': 'ឈប់ វីដេអូ',
          'play_video': 'លេង វីដេអូ',
          'more': 'ត្រឡប់មកវិញ',
          'next_video': 'វីដេអូបន្ទាប់',
          'google_map': 'ទីតាំង'
        },
      };
}
