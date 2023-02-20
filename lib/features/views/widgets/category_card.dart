import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:market_1_app/core/provider/provider_screen.dart';
import 'package:market_1_app/features/views/screens/details_screen.dart';
import 'package:provider/provider.dart';

import '../../../core/constants.dart';
import '../../../core/utils/size_config.dart';
import 'dart:convert';

class CategoryCard extends StatelessWidget {
  CategoryCard({super.key, required this.category_items, required this.Items});
  final category_items;
  final List<Map<String, dynamic>> Items;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Text(
                "${category_items['category_name']}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "${category_items['category_dis']}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: MainColor,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  print(category_items.runtimeType);
                  print(Items);
                },
                child: Text(
                  "${category_items['category_dec']}",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: Items.map(
            (e) => InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(category_items: e),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.grey[200],
                      child: Stack(
                        children: [
                          Container(
                            width: SizeConfig.defaultSize! * 11,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Image.asset(
                              "${e['product_image']}",
                              height: SizeConfig.defaultSize! * 13,
                              width: SizeConfig.defaultSize! * 11,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            right: 5,
                            top: 5,
                            child: InkWell(
                              onTap: () {
                                add_favourit_product(context, e);
                              },
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: primaryColor,
                                child: Icon(
                                  FontAwesomeIcons.heart,
                                  size: 18,
                                  color: int.parse(
                                              e['product_liked'].toString()) ==
                                          0
                                      ? Colors.amber
                                      : Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 110,
                      height: 30,
                      // color: Colors.blue,
                      child: ListView.builder(
                        itemCount: int.parse(e['product_rating'].toString()),
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
                    Text(
                      "${e['product_name']}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "${e['product_price']}\$ per/kg",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ).toList()),
        ),
      ],
    );
  }

  void add_favourit_product(context, e) async {
    int like = await int.parse(e['product_liked'].toString());
    if (like == 0) {
      Provider.of<ProviderScreen>(context, listen: false).addToFavouritCart(
        e['product_name'],
        e['product_image'],
        e['product_price'],
        category_items['category_dec'],
        1,
        Items.indexOf(e),
      );
    }

    Provider.of<ProviderScreen>(context, listen: false)
        .change_liked_products(like);
    e['product_liked'] =
        Provider.of<ProviderScreen>(context, listen: false).liked;
  }
}
