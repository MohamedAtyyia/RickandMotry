import 'package:flutter/material.dart';

class ShowerroeMessage extends StatelessWidget {
  const ShowerroeMessage({super.key, required this.erroMessage});
  final String erroMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        erroMessage,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: Colors.white),
      ),
    );
  }
}