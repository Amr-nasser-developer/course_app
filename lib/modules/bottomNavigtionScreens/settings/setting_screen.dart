import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:courseapp/modules/bottomNavigtionScreens/settings/cubit/cubit.dart';
import 'package:courseapp/modules/bottomNavigtionScreens/settings/cubit/states.dart';
import 'package:courseapp/modules/welcome/welcome_screen.dart';
import 'package:courseapp/shared/componads.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool checkBox = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> SettingCubit(),
      child: BlocConsumer<SettingCubit, SettingState>(
        listener: (context , state){},
        builder: (context , state){
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10.0,),
                  SizedBox(height: 30,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defaultDetailsText('Account Settings'),
                      SizedBox(height: 10.0,),
                      defaultBottomForm(text: 'Account Security'),
                      SizedBox(height: 1,),
                      defaultBottomForm(text: 'Email Notifications'),
                      SizedBox(height: 1,),
                      defaultBottomForm(text: 'Push Notifications'),
                      SizedBox(height: 1,),
                      Container(
                        width: 320,
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child :Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Notification',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.only(right: 0.0),
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Checkbox(
                                          value: SettingCubit.get(context).Case ,
                                          onChanged: (bool value){
                                            SettingCubit.get(context).check(value);
                                            // SettingCubit.get(context).Case = value;
                                            // SettingCubit.get(context).Notification(value);
                                            // if(getToken()!= null && getToken().length>0) {
                                            //   checkBox = value;
                                            //}
                                          },

                                      ),
                                    ],
                                  )
                              ),
                            )

                          ],
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 55.0,),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Container(
                        alignment: Alignment.topLeft,
                        child: defaultDetailsText('support')),
                  ),
                  SizedBox(height: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      defaultBottomForm(text: 'About App' ),
                      SizedBox(height: 1,),
                      defaultBottomForm(text: 'Frequently asked questions'),
                      SizedBox(height: 1,),
                      defaultBottomForm(text: 'Contact Us'),
                      SizedBox(height: 1,),
                      defaultBottomForm(text: 'Log Out', function: () {
                        deleteToken().then((value) => finishNavigate(context, WelecomeScreen()));
                      })
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}