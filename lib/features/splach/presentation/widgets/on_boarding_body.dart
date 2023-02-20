import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:market_1_app/core/constants.dart';
import 'package:market_1_app/core/shared/cach_helper.dart';
import 'package:market_1_app/core/utils/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/widgets/custom_button.dart';
import '../../../Auth/presentaion/login/Login_Screen.dart';
import 'custom_page_view.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  //  final double dotIndex =0;
   PageController ?pageController ;
   @override
   void initState() { 
    pageController = PageController(
      initialPage: 0
    )..addListener(() => setState(() {
      
    }));
     super.initState();
     
   }


  @override
  Widget build(BuildContext context) {
    return Stack(
      
      children: 
      [
        CustomPageView(pageController: pageController),

        Positioned(
           bottom: SizeConfig.defaultSize! *23,
           left: 0,
           right: 0,
          child: DotsIndicator(
            dotsCount: 3,
            position: pageController!.hasClients? pageController!.page ??0 : 0,
            decorator: DotsDecorator(
              color: Colors.transparent,
              activeColor: MainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: MainColor)
                )
              ),
            
            ),
        ),
        Visibility(
          visible: pageController!.hasClients ? (pageController!.page ==2 ?false : true) :true ,
          child: Positioned(
            top: MediaQuery.of(context).size.height * .1,
            right: 32,
            child: GestureDetector(
              onTap: () {
                 Get.to(()=> LoginScreen() , 
                transition: Transition.rightToLeft,
                 duration: Duration(microseconds: 500)
                 );
                CacheHelper.setBooleanItem('onBoarding',true) ;    
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  color: Color(0xff898989),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ),

        Positioned(
          bottom: SizeConfig.defaultSize! *10,
          left:SizeConfig.defaultSize! *10 ,
          right: SizeConfig.defaultSize! *10,
          child: 
          CustomGeneralButton(
            onTap: ()  {
              if(pageController!.page! < 2 )
              {
                pageController?.nextPage(
                  duration: Duration(microseconds: 500),
                  curve: Curves.easeIn
                );
              }else{
                Get.to(()=> LoginScreen() , 
                transition: Transition.rightToLeft,
                 duration: Duration(microseconds: 500)
                 );

                 CacheHelper.setBooleanItem('onBoarding',true) ;      
              }
            },
            text: pageController!.hasClients? pageController!.page ==2 ?"Get Started" : "Next" : 'Next',
            height: 50,
            
          
          ),
          ),
      ],
    );
  }
 
 
  
}