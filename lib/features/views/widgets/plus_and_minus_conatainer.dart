import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlusAndMinusContainer extends StatelessWidget {
  const PlusAndMinusContainer({super.key,required this.icon});

  final IconData icon ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Icon(
        icon,
        size: 21,
        color: Colors.grey[700],
      ),
    );
  }
}
