import 'package:app_flutter/Feature/data/model/character_model/character_model.dart';
import 'package:app_flutter/Feature/presention/view/widget/ItemCaracter.dart';
import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key, required this.AllCharacter});
  final List<CharacterModel> AllCharacter;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: AllCharacter.length,
      // shrinkWrap: true,
      itemBuilder: (context, index) {
          
        return ItemCharacter(OneCharacter: AllCharacter[index]);
            
      },
    );
  }
}
