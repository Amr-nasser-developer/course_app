import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:courseapp/modules/layout/Home_Screen.dart';
import 'package:courseapp/modules/welcome/welcome_screen.dart';
import 'package:courseapp/shared/color.dart';
import 'package:courseapp/shared/componads.dart';
import 'package:courseapp/shared/remote/dio.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    var widget;
    FirebaseMessaging().subscribeToTopic('juniors');
    await initPref().then((value) {
      if(getToken() != null && getToken().length > 0) {
        print('---- token exist');
        widget = HomeScreen();
      }
      else
      {
        print('---- token not exist');
        widget = WelecomeScreen();
      }
    });

    runApp(MyApp(widget));
  }

class MyApp extends StatelessWidget {
  var widget;
  MyApp(this.widget);
  @override
  Widget build(BuildContext context) {
    DioHelper();
    setFirebaseMessaging();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: defaultColor,
          ),
          scaffoldBackgroundColor: Colors.grey[200]
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
setFirebaseMessaging()
{
  FirebaseMessaging().configure(
      onMessage: (msg)
      {
        print('notification received');
        print(msg.toString());
        return null;
      }
  );
}
