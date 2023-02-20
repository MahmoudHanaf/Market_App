import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:market_1_app/features/views/screens/cart_screen.dart';
import 'package:provider/provider.dart';
import '../../../core/constants.dart';
import '../../../core/provider/provider_screen.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/utils/widgets/custom_button.dart';
import '../widgets/plus_and_minus_conatainer.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MainColor,
        title: Text(
          "Shopping Cart",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: MainColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        child: Column(
          children: [
            Container(
              height: SizeConfig.screenHeight! *.62,
             
              child: Column(
                children: Provider.of<ProviderScreen>(context).Cart.length==0 ?
                [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height:SizeConfig.screenHeight! *.40 ,
                        ),
                        Text(
                          "Thre is no products in cart",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            
                          ),
                          ),
                      ],
                    ),
                  ),
                ]
                :
                 Provider.of<ProviderScreen>(context).Cart.map((e) =>
                   
                   Padding(
                padding: const EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 5),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Row(
                          children: [
                            Container(
                              width: SizeConfig.defaultSize! * 11,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Image.asset(
                                "${e['product_image']}",
                                height: SizeConfig.defaultSize! * 13,
                                width: SizeConfig.defaultSize! * 12,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    // mainAxisSize: MainAxisSize.min,
                          
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          "${e['product_name']}",
                                          style: TextStyle(
                                              fontSize: 18, fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        "Rs 40 Saved",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: MainColor),
                                      ),
                                      SizedBox(
                                        width: 1,
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          size: 30,
                                        ),
                                        onPressed: () 
                                        { 
                                          AlertDialog(
                                            title: Text("Do you wante to delete this product"),
                                            actions: 
                                            [ 
                                              
                                            ],
                                          );
                                          Provider.of<ProviderScreen>(context,listen: false).deleteCart(
                                              Provider.of<ProviderScreen>(context,listen: false).Cart.indexOf(e) 
                                            );
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Rs 190",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${e['product_price']} Per/ kg",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          
                                  Container(
                                    width: SizeConfig.defaultSize ! * 25,
                                    // color: Colors.amber,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: 
                                      [
                                      InkWell(
                                        onTap: () {
                                          Provider.of<ProviderScreen>(context,listen: false).minus_quantity(
                                              Provider.of<ProviderScreen>(context,listen: false).Cart.indexOf(e) 
                                            );
                                        },
                                        child: 
                                        PlusAndMinusContainer(icon: FontAwesomeIcons.minus,)),
                                      SizedBox(width: 12,),
                                         Text(
                                      "${e['quantity']}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey[700]
                                      ),
                                         ),
                          
                                         SizedBox(width: 12,),
                                         InkWell(
                                          onTap: () {
                                            Provider.of<ProviderScreen>(context,listen: false).plus_quantity(
                                              Provider.of<ProviderScreen>(context,listen: false).Cart.indexOf(e) 
                                            );
                                            // print(Provider.of<ProviderScreen>(context,listen: false).Cart.indexOf(e) );
                                          },
                                          child: PlusAndMinusContainer(icon:FontAwesomeIcons.plus,)),
                                        
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Divider(color: Colors.grey[600],),
                  ],
                ),
              ),
      
                 ).toList(),
              ),
            ),

          
          ],
        ),
      ),
    );
  }
}