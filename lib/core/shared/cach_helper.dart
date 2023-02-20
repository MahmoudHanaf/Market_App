import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? pref;

  static void init() async {
    pref = await SharedPreferences.getInstance();
  }

 static Future<bool> onBoarding() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
   return  pref.getBool('onBoarding') ??false;
  }

 static Future<bool?> onLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool('onLogin');
  }

  static Future<void> SaveDataCach(String key ,String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
     pref.setString(key,value);
  }
  
  static  Future<void> setBooleanItem (String key ,bool value) async
 {
   SharedPreferences pref  =  await SharedPreferences.getInstance();
   pref.setBool(key,value);

 }
 

}
