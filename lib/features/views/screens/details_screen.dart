import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:market_1_app/core/provider/provider_screen.dart';
import 'package:market_1_app/features/views/screens/cart_screen.dart';
import 'package:provider/provider.dart';

import '../../../core/constants.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/utils/widgets/custom_button.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key,this.category_items});
  final category_items;
  final List<Map<String, dynamic>> Nutrition = [
    {
      'name': 'Fiber',
    },
    {
      'name': 'Potassium',
    },
    {
      'name': 'Iron',
    },
    {
      'name': 'Magnesium',
    },
    {
      'name': 'Vitamin C',
    },
    {
      'name': 'Vitamin K',
    },
    {
      'name': 'Zinc',
    },
    {
      'name': 'Phosphorous',
    }
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MainColor,
        title: Text(
          "Details",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: MainColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * .9,
                height: SizeConfig.defaultSize! * 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage("${category_items['product_image']}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "${category_items['product_name']}",
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "${category_items['product_description']}",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Nutrition",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Column(
              children: Nutrition.map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${e['name']}",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ).toList(),
            ),
            SizedBox(height: 15,),
            Row(
              children: 
              [
              Text(
              "${category_items['product_price']} LE Per/ kg",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),         
            SizedBox(
              width: SizeConfig.defaultSize ! *5,
             ),
            CustomGeneralButton(
                onTap: () {
                  Provider.of<ProviderScreen>(context,listen: false).addToCard(
                    category_items['product_name'],
                    category_items['product_image'],
                    category_items['product_price'],
                     1
                    );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ),
                  );
                },
                text: "Buy Now",
                fontSize: 18,
                width: SizeConfig.defaultSize ! *17,
                height: 50,
              ),
             
              ],)
          ]),
        ),
      ),
    );
  }
}
