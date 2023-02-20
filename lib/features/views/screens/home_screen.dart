import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:market_1_app/core/provider/provider_screen.dart';
import 'package:provider/provider.dart';

import '../../../core/constants.dart';
import '../../../core/utils/size_config.dart';
import '../widgets/category_card.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   @override
  void initState() {
    //  Provider.of<ProviderScreen>(context,listen: false).getCategories();
    onInit();
    super.initState();
  }

  void onInit() async
  {
   await FirebaseMessaging.instance.getToken().then((value)
    {
      print(value);
       WidgetsFlutterBinding.ensureInitialized();
      String? token =value ;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MainColor,
        title: Text(
          "Fruit Market",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: MainColor,
        ),
        actions: [
          Icon(
            Icons.notifications,
            size: 28,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          // color: primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: SizeConfig.defaultSize! * 5,
                    color: MainColor,
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 9,
                    child: Center(
                      child: Container(
                        width: SizeConfig.defaultSize! * 34,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintStyle: TextStyle(fontSize: 17),
                            hintText: 'Search',
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(20),
                            fillColor: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      
              // Container(
              //   child: Tap,
              // ),
               
           
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: Provider.of<ProviderScreen>(context).Categories.map((e) =>  
                   CategoryCard(category_items: e,
                   Items:e['Items']as List<Map<String, dynamic>> ,)
                 
                 ).toList()
                ,
              ), 
             
            
              
            ],
          ),
        ),
      ),
    );
  }
}
