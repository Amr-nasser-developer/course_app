import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:courseapp/modules/bottomNavigtionScreens/courses/course_screen.dart';
import 'package:courseapp/modules/bottomNavigtionScreens/profile/profile_screen.dart';
import 'package:courseapp/modules/bottomNavigtionScreens/search/search_screen.dart';
import 'package:courseapp/modules/bottomNavigtionScreens/settings/setting_screen.dart';
import 'package:courseapp/modules/layout/cubit/states.dart';
import 'package:courseapp/shared/remote/dio.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  var widgets = [
    CourseScreen(),
    SearchScreen(),
    ProfileScreen(),
    SettingScreen(),
  ];

  var titles = [
    'Courses',
    'Search',
    'Profile',
    'Setting'
  ];

  int currentIndex = 0;

  void changeIndex(index){
    currentIndex = index;
    emit(HomeIndex());
  }

  getNoti() {
    var model = {
      "to": "/topics/juniors",
      "notification": {
        "title": "Courses App",
        "body": "go to the app to see what new",
        "sound": "default"
      },
      "android": {
        "priority": "HIGH",
        "notification": {
          "notification_priority": "PRIORITY_MAX",
          "sound": "default",
          "default_sound": true,
          "default_vibrate_timings": true,
          "default_light_settings": true
        }
      },
      "data": {
        "url": "hhhhh",
        "id": "yyyyyy",
      }
    };
    DioHelper.postNotification(
      path: 'fcm/send',
      data: jsonEncode(model),
    ).then((value) {
      print('Success Notification');
      emit(HomeSuccess());
    }).catchError((e) {
      emit(HomeError(e.toString()));
      print(e.toString());
    });
  }

}