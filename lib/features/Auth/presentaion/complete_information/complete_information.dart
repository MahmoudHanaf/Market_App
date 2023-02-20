import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:market_1_app/core/utils/size_config.dart';
import 'package:market_1_app/core/utils/widgets/custom_button.dart';
import 'package:market_1_app/core/utils/widgets/custom_text_filed.dart';

class CompleteInformation extends StatelessWidget {
  const CompleteInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: 
              [
                SizedBox(
                  height: SizeConfig.defaultSize! *8,
                ),
                Text(
                      "Enter Your Name",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  
                   CustomTextFiled(
                    inputType: TextInputType.name,
                    maxLines: 1,
                    onChanged: (value) {},
                    onSaved: (value) {},
                   ), 
      
                   SizedBox(
                  height: SizeConfig.defaultSize! *3,
                ),
      
                Text(
                      "Enter Your Phone",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  
                   CustomTextFiled(
                    inputType: TextInputType.phone,
                    maxLines: 1,
                    onChanged: (value) {},
                    onSaved: (value) {},
                   ), 
      
                    SizedBox(
                  height: SizeConfig.defaultSize! *3,
                ),
      
                 Text(
                      "Enter Your Address",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  
                   CustomTextFiled(
                    inputType: TextInputType.multiline,
                    maxLines: 5,
                    onChanged: (value) {},
                    onSaved: (value) {},
                   ), 
                   
                    SizedBox(
                  height: SizeConfig.defaultSize! *7,
                ),
      
                CustomGeneralButton(
                  onTap: () {},
                  text: "Log In",
                  fontSize: 20,
                ),
              ],
          ),
        ),
      ),
    );
  }
}