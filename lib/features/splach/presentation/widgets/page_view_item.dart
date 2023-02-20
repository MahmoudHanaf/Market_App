import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:market_1_app/core/utils/size_config.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, this.title, this.subTitle, this.image});
  final String ?title;
  final String ?subTitle;
  final String ?image;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.defaultSize! *18,
          ),
          SizedBox(
            height: SizeConfig.defaultSize! *20,
            child: Image.asset(image!,
            width: SizeConfig.defaultSize! *28,
            fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: SizeConfig.defaultSize! *3.5,
          ),
          Text(
             title!,
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Poppins',
              color: Color(0xff2f2e41),
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: SizeConfig.defaultSize! *1.5,
          ),
           Text(
            subTitle!,
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Poppins',
             color: Color(0xff2f2e41),
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
