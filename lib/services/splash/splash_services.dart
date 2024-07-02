import 'dart:async';

import 'package:clean_coding/config/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';

class SplashServices{

  void isLogin(BuildContext context){

    Timer(Duration(seconds: 2), ()=>
        Navigator.pushNamedAndRemoveUntil(context,RoutesName.loginScreen,(route)=> false));
  }
}