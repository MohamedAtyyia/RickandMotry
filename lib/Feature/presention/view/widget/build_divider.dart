import 'package:app_flutter/util/myColor.dart';
import 'package:flutter/material.dart';

class BuildDivider extends StatelessWidget {
  const BuildDivider({super.key, required this.sizewidth});
  final double sizewidth;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: sizewidth,
      child:const  Divider(
        color:myColor.kYellow,
        
        thickness: 3,
      ),
    );
  }
}