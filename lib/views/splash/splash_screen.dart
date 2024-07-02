import 'package:clean_coding/config/components/internet_exception_widget.dart';
import 'package:clean_coding/config/data/exceptions/app_exceptions.dart';
import 'package:clean_coding/services/splash/splash_services.dart';
import 'package:flutter/material.dart';

import '../../config/color/colors.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices _splashServices = SplashServices();

  @override
  void initState() {

    super.initState();
    _splashServices.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Splash Screen',style: TextStyle(fontSize: 30),)

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: InternetExceptionWidget(onPress: (){},),
            // ),

            // RoundButton(
            //     title: 'Login',
            //     onPress: (){
            //       Navigator.pushNamed(context, RoutesName.homeScreen);
            //     },
            //   height: 40,
            // ),
            // LoadingWidget(),
            // TextButton(
            //   onPressed: (){
            //     Navigator.pushNamed(context, RoutesName.homeScreen);
            //
            //   },
            //   child: Text('Home Screen'),
            // ),
          ],
        ),
      ),
    );
  }
}
