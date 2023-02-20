import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constants.dart';
import '../screens/profile_screen.dart';

class BottomNavigationHome extends StatelessWidget {
  const BottomNavigationHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
         
         child: BottomNavigationBar(
              //  selectedItemColor: Colors.grey,
              // enableFeedback: true,
              // selectedIconTheme: IconThemeData(color: Colors.black54),
              //  fixedColor: Color(0xfffffff),
              //  showSelectedLabels: true,
              //  unselectedItemColor:Colors.black54 ,
              //  selectedLabelStyle: TextStyle(color: Colors.black87),
                selectedItemColor: MainColor,
                unselectedItemColor: Colors.black45,
                unselectedLabelStyle: TextStyle(
                  color: Colors.blue
                ),
                currentIndex: 0,
                  items: 
                  [
                     BottomNavigationBarItem(
                     
                      icon: Icon(Icons.home,),
                      label: "Home",
                      
                     ),
                     BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart,),
                      label: "Shopping Cart"
                      
                     ),
                     BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.heart,),
                      label: "Favourite"
                      
                     ),
                     BottomNavigationBarItem(
                      icon: IconButton(
                        icon:Icon(Icons.person,),
                         onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(),
                            ),
                          )
                         },
                         ),
                      label: "My Acount"
                     ),
                  ],
               ),
    );
  }
}