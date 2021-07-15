import 'package:dio/dio.dart';

class DioHelper{
  static Dio dio;

  DioHelper(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://softagic.wwwnl1-ss19.a2hosted.com/',
        headers: {
          'Accept':'application/json',
        },
      ),
    );
  }
  static Future<Response> postData({path , data, token, query})async{
    if(token != null){
      dio.options.headers = {'Authorization':'Bearer $token'};
    }
    return await dio.post(
        path,
        data: data ?? null,
        queryParameters: query ?? null
    );
  }
  static Future<Response> postNotification({path , data})async{
    dio.options.baseUrl = 'https://fcm.googleapis.com/';
    dio.options.headers =
    {
      'Content-Type':'application/json',
      'Authorization' : 'key=AAAAIC-oEd8:APA91bFJs6AaBqzPTbOyJdu1LzYjN7TgS2WJneRUCxq3Xd1D0jg1hp6yeo7rM3VtaRbJwc1dDHgGFumA0Q-c6VUqlK8W5SUnXk6WATGl020LXEdfP9DSY1rFlvAJDh6tXTBJJETAV3bP',
    };
    return await dio.post(
        path,
        data: data ?? null,
    );
  }
}