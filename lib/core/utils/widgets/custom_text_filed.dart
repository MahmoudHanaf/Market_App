import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextFiled extends StatelessWidget {
  final TextInputType ? inputType;
  // final Widget ? suufixIcon;
  final ValueSetter ? onChanged;
  final ValueSetter ? onSaved;
  final int ? maxLines ;
  const CustomTextFiled({super.key, 
  this.inputType,
  //  this.suufixIcon, 
   this.onChanged, 
   this.onSaved, 
   this.maxLines
   });
  
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        keyboardType: TextInputType.name ,
        onChanged: onChanged,
        onSaved: onSaved,
        maxLines: maxLines,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xffcccccc))
            )
        ),
      ),
    );
  }
}