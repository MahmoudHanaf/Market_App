import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:market_1_app/core/provider/provider_screen.dart';
import 'package:market_1_app/features/views/screens/cart_screen.dart';
import 'package:provider/provider.dart';

import '../../../core/constants.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/utils/widgets/custom_button.dart';
import '../widgets/plus_and_minus_conatainer.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MainColor,
        title: Text(
          "Favourites",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: MainColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
         children:  Provider.of<ProviderScreen>(context).Favourit_Cart.map((e) =>
            
          Column(
          children: 
          [
            Padding(
              padding: const EdgeInsets.only(left: 8,top: 20),
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
                            Text(
                              "${e['product_name']}",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: SizeConfig.defaultSize ! *7,
                            ),
                            Text(
                              "${e['product_price']} Per/ kg",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  
                                  ),
                            ),
                           
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Pick up from organic farms",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                              width: 110,
                              height: 30,
                              // color: Colors.blue,
                              child: ListView.builder(
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18,
                                  );
                                },
                              ),
                            ),
                           
                        Container(
                          width: SizeConfig.defaultSize! * 27,
                          // color: Colors.amber,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                        onTap: ()  async{
                                           int quantity =await int.parse(e['quantity'].toString()) ;
                                          Provider.of<ProviderScreen>(context,listen: false).minus_quantity_favourit( quantity);
                                           e['quantity'] = Provider.of<ProviderScreen>(context,listen: false).quantity_favourit;e['quantity'] =Provider.of<ProviderScreen>(context,listen: false).quantity_favourit ;
                                        },
                                        child: 
                                        PlusAndMinusContainer(icon: FontAwesomeIcons.minus,)),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                "${e['quantity']}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[700]),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                               InkWell(
                                          onTap: () async {
                                              int quantity =await int.parse(e['quantity'].toString()) ;
                                               Provider.of<ProviderScreen>(context,listen: false).plus_quantity_favourit( quantity);
                                           e['quantity'] = Provider.of<ProviderScreen>(context,listen: false).quantity_favourit;
                                           print(Provider.of<ProviderScreen>(context,listen: false).quantity_favourit);
                                            // print(Provider.of<ProviderScreen>(context,listen: false).Cart.indexOf(e) );
                                          },
                                          child: PlusAndMinusContainer(icon:FontAwesomeIcons.plus,)),
                              SizedBox(
                                width: SizeConfig.defaultSize! *4.8,
                              ),
                              CustomGeneralButton(
                                text: "Add",
                                onTap: () {
                                  Provider.of<ProviderScreen>(context,listen: false).addToCard(
                                  e['product_name'],
                                  e['product_image'],
                                  e['product_price'],
                                   e['quantity'],
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => CartScreen(),),
                                  );
                                },
                                fontSize: 19,
                                height: 40,
                                width: 90,
                                color: Color(0xFFCC7D00),
                              ),
      
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5,),
            Divider(
              color: Colors.grey[600],
            ),
          ],
        ),
          
          ).toList(),
        ),
      ),
    );
  }
}
