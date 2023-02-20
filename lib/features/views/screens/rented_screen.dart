import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:market_1_app/core/constants.dart';

class RentedScreen extends StatelessWidget {
  const RentedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: 
        [
          Icon(
            Icons.check_circle_outline_outlined,
            size: 45,
            color: MainColor,
          ),

          SizedBox(
            height: 10,
          ),
          Text(
            "Payment Successful \nYour Order is Booked",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}