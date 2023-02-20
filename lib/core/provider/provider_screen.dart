import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:market_1_app/features/models/category_model.dart';
import 'package:market_1_app/features/models/category_model.dart';
import 'package:market_1_app/features/views/screens/cart_screen.dart';
import 'package:market_1_app/features/views/screens/main_screen.dart';
import 'package:market_1_app/features/views/screens/profile_screen.dart';

import '../../features/models/category_model.dart';
import '../../features/models/category_model.dart';
import '../../features/views/screens/favourite_screeen.dart';
import '../../features/views/screens/home_screen.dart';
import '../../features/views/screens/profile_screen.dart';
import '../../features/views/screens/shopping_cart_screen.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ProviderScreen extends ChangeNotifier {
  int currentIndex = 0;
  bool passwordIcon = true;

  void changeVisibilityPassword() {
    passwordIcon = passwordIcon == true ? false : true;

    notifyListeners();
  }

  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: "Home",
    ),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.shopping_cart,
        ),
        label: "Shopping Cart"),
    BottomNavigationBarItem(
        icon: Icon(
          FontAwesomeIcons.heart,
        ),
        label: "Favourite"),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
        ),
        label: "My Acount"),
  ];

  List Screens = [
    HomeScreen(),
    ShoppingCartScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];

  void ChangeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 0) {
      HomeScreen();
    } else if (index == 1) {
      ShoppingCartScreen();
    } else if (index == 2) {
      FavouriteScreen();
    } else {
      ProfileScreen();
    }

    notifyListeners();
  }

  List<Map<String,Object>> Categories = 
  [
    {
      "category_name":"Organic Fruits",
      "category_dec":"Pick up from organic farms",
      "category_dis":"(20% Off)",
      "Items":[
        {
          "product_name":"Strawberry",
          "product_price":300,
          "product_rating":4,
          "product_description":"Grapes will provide natural nutrients. The Chemical in organic grapes which can be healthier hair a",
          "product_Nutrition":"Fiber//Potassium//Iron//Magnesium//Vitamin C//Vitamin K//Zinc//Phosphorous",
          "product_image":"assets/images/fruit1.png",
          "product_liked":0,
        },
        {
          "product_name":"Grapes",
          "product_price":160,
          "product_rating":5,
          "product_description":"Grapes will provide natural nutrients. The Chemical in organic grapes which can be healthier hair a",
          "product_Nutrition":"Fiber//Potassium//Iron//Magnesium//Vitamin C//Vitamin K//Zinc//Phosphorous",
          "product_image":"assets/images/fruit2.png",
          "product_liked":1,
        },
        {
          "product_name":"Oranges",
          "product_price":120,
          "product_rating":5,
          "product_description":"Oranges will provide natural nutrients. The Chemical in organic grapes which can be healthier hair a",
          "product_Nutrition":"Fiber//Potassium//Iron//Magnesium//Vitamin C//Vitamin K//Zinc//Phosphorous",
          "product_image":"assets/images/fruit3.png",
          "product_liked":0,
        },
      ],
    },
    {
      "category_name":"Mixed Fruit Pack",
      "category_dec":"Fruit mix fresh pack",
      "category_dis":"(10% Off)",
      "Items":[
        {
          "product_name":"Multi Fruits Pack",
          "product_price":350,
          "product_rating":5,
          "product_description":"Multi Fruits Pack will provide natural nutrients. The Chemical in organic grapes which can be healthier hair a",
          "product_Nutrition":"Fiber//Potassium//Iron//Magnesium//Vitamin C//Vitamin K//Zinc//Phosphorous",
          "product_image":"assets/images/fruit4.jpg",
          "product_liked":1,
        },
        {
          "product_name":"Paper Fruits Pack",
          "product_price":230,
          "product_rating":3,
          "product_description":"Paper Fruits Pack will provide natural nutrients. The Chemical in organic grapes which can be healthier hair a",
          "product_Nutrition":"Fiber//Potassium//Iron//Magnesium//Vitamin C//Vitamin K//Zinc//Phosphorous",
          "product_image":"assets/images/fruit5.jpg",
          "product_liked":0,
        },
        {
          "product_name":"Tropicana",
          "product_price":140,
          "product_rating":5,
          "product_description":"Tropicana will provide natural nutrients. The Chemical in organic grapes which can be healthier hair a",
          "product_Nutrition":"Fiber//Potassium//Iron//Magnesium//Vitamin C//Vitamin K//Zinc//Phosphorous",
          "product_image":"assets/images/fruit6.jpg",
          "product_liked":0,
        },
      ],
    },
    {
      "category_name":"Melons",
      "category_dec":"Fresh Melons Fruits",
      "category_dis":"(5% Off)",
      "Items":[
        {
          "product_name":"Green Watermelon",
          "product_price":300,
          "product_rating":4,
          "product_description":"Green Watermelon will provide natural nutrients. The Chemical in organic grapes which can be healthier hair a",
          "product_Nutrition":"Fiber//Potassium//Iron//Magnesium//Vitamin C//Vitamin K//Zinc//Phosphorous",
          "product_image":"assets/images/fruit7.jpg",
          "product_liked":0,
        },
        {
          "product_name":"Squash",
          "product_price":160,
          "product_rating":5,
          "product_description":"Grapes will provide natural nutrients. The Chemical in organic grapes which can be healthier hair a",
          "product_Nutrition":"Fiber//Potassium//Iron//Magnesium//Vitamin C//Vitamin K//Zinc//Phosphorous",
          "product_image":"assets/images/fruit8.jpg",
          "product_liked":0,
        },
        {
          "product_name":"Watermelon",
          "product_price":120,
          "product_rating":5,
          "product_description":"Watermelon will provide natural nutrients. The Chemical in organic grapes which can be healthier hair a",
          "product_Nutrition":"Fiber//Potassium//Iron//Magnesium//Vitamin C//Vitamin K//Zinc//Phosphorous",
          "product_image":"assets/images/fruit9.jpg",
          "product_liked":1,
        },
      ],
    },
    
  ];
  
   
  List<Map<String,dynamic>> Cart =[];
  int Total =0;
 void  addToCard (String product_name, String product_image,int product_price,int quantity  )
 {
    Cart.add(
      {
        // "email":email,
        "product_name":product_name,
        "product_image":product_image,
        "product_price":product_price,
        "quantity":quantity,
      }
    );
    Total += product_price * quantity;
    notifyListeners();
 }

 void plus_quantity (int index)
 {

    Cart[index]['quantity'] +=1 ;
    Total += int.parse(Cart[index]['product_price'].toString()) ;
    notifyListeners();
 }

  void minus_quantity (int index)
 {
   if(Cart[index]['quantity'] >1)
   {
     Cart[index]['quantity'] -=1 ;
     Total -= int.parse(Cart[index]['product_price'].toString()) ;
    notifyListeners();
   }  
 }

 void deleteCart (int index)
 {   
    int product_price =int.parse(Cart[index]['product_price'].toString()) ;
    int quantity = int.parse(Cart[index]['quantity'].toString()) ;
    Total -= product_price * quantity;
    Cart.removeAt(index);
   
    notifyListeners();
 }


List<Map<String,dynamic>> Favourit_Cart =[];

 void  addToFavouritCart (String product_name, String product_image,
 int product_price,String category_dec , int quantity,int index )
 {
    Favourit_Cart.add(
      {
        "product_name":product_name,
        "product_image":product_image,
        "product_price":product_price,
        "category_dec":category_dec,
        "quantity":quantity,
        "index":index
      }
    );
    print(int.parse(index.toString()));
    notifyListeners();
 }

 bool like = false ;
 void change_like_color ()
 {
    if(like == true)
    {
      like = false;
    }else{
      like = true;
    }
    notifyListeners();
 }

 late int quantity_favourit ;
 void plus_quantity_favourit (int quantity)
 {
   quantity_favourit =quantity ;
   quantity_favourit +=1;
   notifyListeners();
 }

 void minus_quantity_favourit (quantity)
 {
  if(quantity >1)
  {
   quantity_favourit =quantity ;
   quantity_favourit -=1;
   notifyListeners();
   
  } 
 }

late int liked ;
void change_liked_products (int like)
 {
  
   if(like ==0)
   {
     liked =1 ;
   }else{
      liked =0 ;
   }
   notifyListeners();
 }
//  void change_liked_product (
//   int index1,
//   int index2,
//   String product_name,
//   String product_image,
//   int product_price,
//   String category_dec)
//  {
//    print(int.parse(Cart[index1][index2]['Items.product_liked'].toString()));
//    int item =int.parse(Cart[index1]['Items'][index2]['product_liked'].toString()) ; 
   
//   if(item ==0)
//   {
//     item =1 ;
//     addToFavouritCart(product_name,product_image,product_price,category_dec);
//   }else{
//      item =0 ;
//   }
//    notifyListeners();
//  }
 
  // void getCategories () async
  // {
  //   try{
  //     var resopnse = await http
  //     .get(Uri.parse("http://192.168.1.2/api/Restaurant_kinds.php"))
  //     .timeout(Duration(seconds: 10));

  //     if(resopnse.statusCode ==200)
  //     {
  //        Categories = List<Map<String, dynamic>>.from(
  //         jsonDecode(resopnse.body)
  //        );
  //        print(Categories);
  //     }else{
  //      Categories = [];  
  //      notifyListeners();
  //     }
  //   }catch(e)
  //   {
  //     Categories =[];
  //     notifyListeners();
  //     print(e);
  //   }
  // }
    


 
  
}
