import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/constants.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent(
      {super.key, required this.text, required this.icon, required this.color});
  final String text;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 55,
            width: double.infinity,
            child: Row(children: [
              Icon(
                icon,
                color: MainColor,
                size: 25,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "${text}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              )
            ]),
          ),
        ),
        Divider(
          color: color,
          height: 1,
        )
      ]),
    );
  }
}
