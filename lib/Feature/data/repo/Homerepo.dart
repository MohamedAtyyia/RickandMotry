import 'package:app_flutter/Feature/data/model/character_model/character_model.dart';
import 'package:app_flutter/util/error.dart';
import 'package:dartz/dartz.dart';

abstract class Homerepo{
  Future<Either<Failuer,List<CharacterModel>>>featchCharacter();

}