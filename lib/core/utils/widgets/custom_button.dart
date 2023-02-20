import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:market_1_app/core/constants.dart';
import 'package:market_1_app/core/utils/size_config.dart';

class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton({super.key,
   required this.text,
   required this.onTap,
    this.fontSize, 
    this.width,
     this.height,
     this.color,
     });
   final String ? text;
   final VoidCallback ?onTap ;
   final double ? fontSize  ;
   final double ? width ;
   final double ? height ;
   final Color ?color  ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        height: height,
        width:width ,
        decoration: BoxDecoration(
          color:color ==null? MainColor : color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
              text!,
              style: TextStyle(
                fontSize: fontSize ?? 14,
                fontFamily: 'Poppins',
                color: Color(0xffffffff),
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.right,
            ),
        ),
      ),
    );
  }
}


class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({super.key,
  required this.text,
  required this.iconData,
  required this.color, 
  required this.onTap
  });
   final String ?text;
   final IconData ?iconData;
   final Color ?color;
   final VoidCallback ?onTap ;
   
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
           color:Colors.transparent ,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color(0xff707070)
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: 
            [
              FaIcon(
                iconData,
                color: color,
                size: 30,
              ),
              SizedBox(width: 15,),
              Text(
                text!,
                style: TextStyle(
                fontSize: 15,
                fontFamily: 'Poppins',
                color: Colors.black,
                fontWeight: FontWeight.w600,
                ),
                textAlign:TextAlign.left ,
              ),
            ],
          ),
      ),
    );
  }
}