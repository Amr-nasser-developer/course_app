import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:courseapp/modules/signup/cubit/states.dart';
import 'package:courseapp/shared/remote/dio.dart';

class CounterCubit extends Cubit<CounterStates>{
  CounterCubit() : super(CounterIntial());
  
  static CounterCubit get(context) => BlocProvider.of(context);
  
  register({first , last , email , password , city}){
    emit(CounterLoading());
    DioHelper.postData(
      path: 'lms/api/v1/auth/signup-save',
      data: {
        'first_name':'$first',
        'last_name': '$last',
        'email':'$email',
        'password' : '$password',
        'city' : '$city'
      }
    ).then((value) {emit(CounterSuccess());
    }).catchError((e){
      emit(CounterError(e.toString()));
    });
  }
}