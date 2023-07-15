import 'package:app_flutter/Feature/data/model/character_model/character_model.dart';
import 'package:app_flutter/Feature/presention/view/widget/sliver_appbar.dart';
import 'package:app_flutter/Feature/presention/view/widget/sliver_list.dart';
import 'package:app_flutter/util/myColor.dart';
import 'package:flutter/material.dart';

class CharacterdetailsScreen extends StatelessWidget {
  const CharacterdetailsScreen({super.key, required this.singelCharacter});
  final CharacterModel singelCharacter;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: myColor.kgrey,
        body: CustomScrollView(
          slivers: [
            BuildSliverAppbar(singelCharacter: singelCharacter),
            BuildSliverList(singelCharacter: singelCharacter)
          ],
        ),
      ),
    );
  }
}
