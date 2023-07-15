import 'package:app_flutter/Feature/data/model/character_model/character_model.dart';
import 'package:app_flutter/Feature/presention/view/CharacterScreen.dart';
import 'package:app_flutter/Feature/presention/view/CharacterdetailsScreen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const kCharacterdetailsScreen = '/CharacterdetailsScreen';
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => CharacterScreen());
      case kCharacterdetailsScreen:
        final singleCharacter = settings.arguments as CharacterModel;
        return MaterialPageRoute(
          
          builder: (_) =>
          
              CharacterdetailsScreen(singelCharacter: singleCharacter),
        );
    }
  }
}
