import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:market_1_app/core/constants.dart';
import 'package:market_1_app/core/provider/provider_screen.dart';
import 'package:market_1_app/core/utils/size_config.dart';
import 'package:market_1_app/features/Auth/presentaion/login/Login_Screen.dart';
import 'package:market_1_app/features/views/screens/main_screen.dart';
import 'package:provider/provider.dart';

import '../../Auth/presentaion/login/Login_Screen.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/category_card.dart';
import 'details_screen.dart';
import 'main_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
//  TabController controller =new TabController(length: 3,vsync:this  );

  @override
  void setState(VoidCallback fn) {
    // onInit();
    super.setState(fn);
  }

 void onInit() async
  {
  await FirebaseMessaging.instance.getToken().then((value)
    {
      print(value);
      String? token =value ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
        body:
        Provider.of<ProviderScreen>(context,).
        Screens[Provider.of<ProviderScreen>(context,listen: false).currentIndex],

        bottomNavigationBar: 
         BottomNavigationBar(
          currentIndex: Provider.of<ProviderScreen>(context,listen: false).currentIndex,
          elevation: 20,
          // backgroundColor: Colors.grey[600],
          // fixedColor: Colors.grey[600],
          selectedItemColor: MainColor,
          unselectedItemColor: Colors.grey[600],
          showUnselectedLabels: true,

          items: Provider.of<ProviderScreen>(context).bottomItem,
          onTap: (value) {
            Provider.of<ProviderScreen>(context,listen: false).ChangeBottomNavBar(value);
            print(Provider.of<ProviderScreen>(context,listen: false).currentIndex);
          },
         ),
        );
  }
}
