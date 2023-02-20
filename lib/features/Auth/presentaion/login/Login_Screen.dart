import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:market_1_app/core/constants.dart';
import 'package:market_1_app/core/provider/provider_screen.dart';
import 'package:market_1_app/core/shared/cach_helper.dart';

import 'package:market_1_app/core/utils/size_config.dart';
import 'package:market_1_app/core/utils/widgets/custom_button.dart';
import 'package:market_1_app/features/Auth/presentaion/complete_information/complete_information.dart';
import 'package:market_1_app/features/Auth/presentaion/login/sign_up.dart';

import 'package:market_1_app/features/Auth/presentaion/login/widgets/auth_text_formFeild.dart';
import 'package:market_1_app/features/Auth/presentaion/login/widgets/my_string.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../views/screens/main_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FirebaseAuth  _auth = FirebaseAuth.instance ;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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
      backgroundColor: Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.defaultSize! * 3,
            ),
            SizedBox(
              child: Image.asset(
                'assets/images/login.png',
                //  height: SizeConfig.defaultSize! * 15,
                fit: BoxFit.contain,
              ),
              height: SizeConfig.defaultSize! * 18,
            ),

            // SizedBox(
            //   height: SizeConfig.defaultSize!*8,
            // ),
            Text(
              "Fruit Market",
              style: TextStyle(
                fontSize: 38,
                fontFamily: 'Poppins',
                color: MainColor,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(
              height: SizeConfig.defaultSize! * 5,
            ),

            Form(
              key: formKey,
              child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
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
                      height: 20,
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
                          onPressed: () 
                          {
                            Login(context);
                          },
                          child: Text(
                            "Log in",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    InkWell(
                     onTap: () async
                     {
                      await signInWithGoogle();
                     },
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey[200]
                          ),
                        child: Icon(FontAwesomeIcons.google, color: Colors.amber[800],),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: 
                      [
                        Text(
                          "Don't hava an account ?",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),

                          TextButton(
                            
                            child: Text(
                              "Sign Up",
                               style: TextStyle(
                                fontSize: 16,
                                 fontWeight: FontWeight.w700,
                                 color: MainColor
                                 ),
                              ),
                              onPressed: () {
                                 Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpScreen(),
                                      
                                  ),
                                  );
                                 
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

  void Login (context) async
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

 Future<void> signInWithGoogle () async
  {
   GoogleSignInAccount? googleSingInAccount= await _googleSignIn.signIn();
   if(googleSingInAccount != null)
   {
    
     GoogleSignInAuthentication googleSignInAuthentication 
      = await  googleSingInAccount.authentication ; 

    AuthCredential authCredential=  GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
     accessToken: googleSignInAuthentication.accessToken
    );

  try 
  {
      UserCredential userCredential = await _auth.signInWithCredential(authCredential);
      User? user =  userCredential.user;
      print('email is ${user?.email}');
      print('name is ${user?.displayName}');
      print('phone is ${user?.photoURL}');
      
  }catch(e)
  {
    print("Error");
    print(e);
  }
  
   }
    
    
    
  
  }

 
}


