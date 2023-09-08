import 'package:app_flutter/Feature/data/model/character_model/character_model.dart';
import 'package:app_flutter/Feature/data/repo/Homerepo.dart';
import 'package:app_flutter/util/ApiService.dart';
import 'package:app_flutter/util/error.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class Homerepoimple implements Homerepo {
  final ApiService apiService;

  Homerepoimple(this.apiService);

 
 @override
  Future<Either<Failuer, List<CharacterModel>>> featchCharacter() async {
    try {
      Map<String, dynamic> data = await apiService.get(endpoint: '/character');
      var characterList = data['results'] as List<dynamic>;
      List<CharacterModel> dataofCharacter = characterList.map((character) => CharacterModel.fromJson(character)).toList();
      return right(dataofCharacter);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailuer.fromdioerror(e));
      }
      return left(ServerFailuer(e.toString()));
    }
  }

}
