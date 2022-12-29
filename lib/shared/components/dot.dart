import 'package:flutter/material.dart';

class dot extends StatelessWidget {

  int active;
  int index;
   dot({
    Key? key,
     required this.index,
     required this.active,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height:20,
      width: index==active?40:10,
      margin:EdgeInsets.all(3),
      decoration:
      BoxDecoration(
          color:index==active?Colors.teal:Colors.teal.withOpacity(0.5),
          shape:BoxShape.circle,
      ),

    );
  }
}