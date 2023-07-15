import 'package:flutter/material.dart';

class Characterinfo extends StatelessWidget {
  const Characterinfo({super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: '$title : ',
            style: const TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}