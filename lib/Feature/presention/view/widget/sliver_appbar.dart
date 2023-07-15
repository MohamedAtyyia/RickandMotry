import 'package:app_flutter/util/myColor.dart';
import 'package:flutter/material.dart';

import '../../../data/model/character_model/character_model.dart';

class BuildSliverAppbar extends StatelessWidget {
  const BuildSliverAppbar({super.key, required this.singelCharacter});
   final CharacterModel singelCharacter;
  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      pinned: true,
      expandedHeight: MediaQuery.of(context).size.height * .7,
      backgroundColor: myColor.kgrey,
      flexibleSpace: FlexibleSpaceBar(
        //  stretchModes: const [StretchMode.zoomBackground],
        expandedTitleScale: 2,
        title: Text(
          singelCharacter.name.toString(),
          style: const TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.normal),
        ),
        background: Hero(
          tag: singelCharacter.id.toString(),
          child: Image.network(
            singelCharacter.image.toString(),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}