import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:courseapp/modules/bottomNavigtionScreens/settings/cubit/states.dart';

class SettingCubit extends Cubit<SettingState>{
  SettingCubit() : super(SettingInitial());

 static SettingCubit get(context) => BlocProvider.of(context);
bool Case = false;
check(value){
  Case = value;
  emit(SettingLoading());
}
 // bool Switch ;
 //  Notification(Switch){
 //   if(Switch==true){
 //     FirebaseMessaging().subscribeToTopic('juniors');
 //   }else{
 //     FirebaseMessaging().unsubscribeFromTopic('juniors');
 //   }
 //   Case = Switch;
 //   emit(SettingSuccess());
 //   emit(SettingError(Error));
 //
 // }

}