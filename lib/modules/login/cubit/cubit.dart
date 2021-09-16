import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/model/login_model.dart';
import 'package:shop_app/modules/login/cubit/states.dart';
import 'package:shop_app/network/end_points.dart';
import 'package:shop_app/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>
{
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

ShopLoginModel loginMode;


  void userLogin({
  @required String email,
  @required String password,
})
  {
    emit(ShopLoginLoadingState());
    DioHelper.postData(
        url: LOGIN,
        data:
        {
          'email':email,
          'password':password,
        },
    ).then((value)
    {
      print(value.data);
      loginMode = ShopLoginModel.fromJson(value.data);
      // print(loginMode.status);
      // print(loginMode.message);
      // print(loginMode.data.token);
      //print(value.data['message']);
      emit(ShopLoginSuccessState(loginMode));
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });

  }



  IconData suffix = Icons.visibility_outlined;
  bool isPassword= true;
  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    
    emit(ShopChangePasswordVisibilityState());
  }




}