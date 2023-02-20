import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:market_1_app/features/Auth/presentaion/login/widgets/auth_text_formFeild.dart';
import 'package:market_1_app/features/Auth/presentaion/login/widgets/my_string.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants.dart';
import '../../../../core/provider/provider_screen.dart';
import '../../../../core/shared/cach_helper.dart';
import '../../../../core/utils/size_config.dart';
import '../../../views/screens/main_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: MainColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.defaultSize! * 1,
            ),
          
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 15),
             child: Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: MainColor,
              ),
             ),
           ),
         SizedBox(
              height: SizeConfig.defaultSize! * 3.5,
            ),
            Form(
              key: formKey,
              child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AuthTextFormField(
                        controller: phoneController,
                        obscureText: false,
                        prefixIcon: Icon(
                          Icons.person,
                          color: MainColor,
                        ),
                        suffixIcon: Text(''),
                        validator: (value) {
                          if (value.toString().length <5) {
                            return "Name Must be complete ";
                          } else {
                            return null;
                          }
                        },
                        hintText: "Name",
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AuthTextFormField(
                        controller: emailController,
                        obscureText: false,
                        prefixIcon: Icon(
                          Icons.email,
                          color: MainColor,
                        ),
                        suffixIcon: Text(''),
                        validator: (value) {
                          if (!RegExp(validationEmail).hasMatch(value)) {
                            return "Invalid Email";
                          } else {
                            return null;
                          }
                        },
                        hintText: "Email",
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AuthTextFormField(
                        controller: passwordController,
                        obscureText:
                            Provider.of<ProviderScreen>(context).passwordIcon,
                        prefixIcon: Icon(
                          Icons.lock_open_outlined,
                          color: MainColor,
                        ),
                        suffixIcon: IconButton(
                          icon:
                              Provider.of<ProviderScreen>(context).passwordIcon
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: Colors.grey[600],
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: Colors.grey[600],
                                    ),
                          onPressed: () {
                            Provider.of<ProviderScreen>(context, listen: false)
                                .changeVisibilityPassword();
                            print(Provider.of<ProviderScreen>(context,
                                    listen: false)
                                .passwordIcon);
                          },
                        ),
                        validator: (value) {
                          if (value == '') {
                            return "Invalid Email";
                          } else {
                            return null;
                          }
                        },
                        hintText: "Password",
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: AuthTextFormField(
                        controller: emailController,
                        obscureText: false,
                        prefixIcon: Icon(
                          Icons.phone_android_outlined,
                          color: MainColor,
                        ),
                        suffixIcon: Text(''),
                        validator: (value) {
                          if (value == null) {
                            return "Invalid phone number";
                          } else {
                            return null;
                          }
                        },
                        hintText: "Phone number",
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: MainColor,
                        ),
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: 
                      [
                        Text(
                          "Do you hava an account ?",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),

                          TextButton(
                            
                            child: Text(
                              "Log in",
                               style: TextStyle(
                                fontSize: 16,
                                 fontWeight: FontWeight.w700,
                                 color: MainColor
                                 ),
                              ),
                              onPressed: () {
                                 SignUp(context);
                              },
                          ),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  void SignUp (context) async
  {
     if(formKey.currentState!.validate())
     {
       CacheHelper.SaveDataCach('email',emailController.text);
        CacheHelper.SaveDataCach('password',passwordController.text);
        CacheHelper.setBooleanItem('onLogin',true);
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => MainScreen()), (route) => false);
     }
  }

  
}