import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:market_1_app/core/constants.dart';
import 'package:market_1_app/core/provider/provider_screen.dart';
import 'package:provider/provider.dart';

import 'core/shared/cach_helper.dart';
import 'features/splach/presentation/splach_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/views/widgets/init.dart';

bool DarkMode =false ;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // initApp();
  CacheHelper.init();

  runApp(MultiProvider(
    providers: 
    [
      ChangeNotifierProvider(create: (context) => ProviderScreen(),)
    ],
    child: FruitMarket()));
}


class FruitMarket extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home : SplachView(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: MainColor),
    );
  }

}

