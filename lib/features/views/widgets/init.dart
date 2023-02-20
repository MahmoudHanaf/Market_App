import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/shared/cach_helper.dart';

void initApp() async
{
//  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
//  await Firebase.initializeApp();
  CacheHelper.init();
}