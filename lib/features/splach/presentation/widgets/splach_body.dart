

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:market_1_app/core/shared/cach_helper.dart';
import 'package:market_1_app/features/Auth/presentaion/login/Login_Screen.dart';
import 'package:market_1_app/features/on%20Boarding/presentation/on_boarding_view.dart';
import 'package:market_1_app/features/views/screens/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/size_config.dart';

class SplachBody extends StatefulWidget {
  const SplachBody({super.key});

  @override
  State<SplachBody> createState() => _SplachBodyState();
}

class _SplachBodyState extends State<SplachBody> with SingleTickerProviderStateMixin {

  AnimationController ?animationController ; 
  Animation ? fadingAnimation ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 800) );
    fadingAnimation =Tween<double>(begin: .2, end: 1).animate(animationController!);
    
    animationController?.repeat(reverse:  true);
    goToNextView();
  }

   @override
  void dispose() {
    animationController?.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Center(
        child: Column(
          
          children: 
          [
            Spacer(),
             AnimatedBuilder(
               animation: fadingAnimation!,
               builder:(context, _)=> Opacity(
                opacity: fadingAnimation?.value,
                 child: Text(
                  "Fruit Market",
                  style: TextStyle(
                    fontSize: 42,
                    fontFamily: 'Poppins',
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                 ),
               ),
             ),
              SizedBox(
                height: 50,
              ),
             Image.asset("assets/images/splach.png",
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.center,
             ),
          ],
        ),
      ),
    );
  }
  
  void goToNextView() 
  {
    Future.delayed(Duration(seconds: 3),
    () async
    {
        SharedPreferences pref = await SharedPreferences.getInstance();
        print(pref.getBool('onBoarding'));
      //  CacheHelper.onBoarding().then((value) => print(value),);
      // Get.to(()=> OnBoardingView(), transition: Transition.fade);
      if(pref.getBool('onBoarding') == true &&
       pref.getBool('onLogin') == true)
      {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ),
          (route) => false,
        );
      }else
      {
          if(pref.getBool('onBoarding') == true)
          {
            Get.to(()=> LoginScreen(), transition: Transition.fade);
          }else{
            Get.to(()=> OnBoardingView(), transition: Transition.fade);
          }
         
      }
     
      //  Get.to(()=> LoginScreen(), transition: Transition.fade);
    }
    );
  }

  
  
}