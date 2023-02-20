import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:market_1_app/features/splach/presentation/widgets/page_view_item.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key,required this.pageController});
  final PageController? pageController ;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
       children: 
       [
        PageViewItem(
        title: "E Shopping",
        subTitle: "Explore  top organic fruits & grab them",
        image: "assets/images/onBoarding1.png",
        ),

        PageViewItem(
        title: "Delivery on the way",
        subTitle: "Get your order by speed delivery",
        image: "assets/images/onBoarding2.png",
        ),

        PageViewItem(
        title: "Delivery Arrived",
        subTitle: "Order is arrived at your Place",
        image: "assets/images/onBoarding3.png",
        ),

       ],
    );
  }
}