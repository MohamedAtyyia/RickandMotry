import 'package:app_flutter/Feature/data/repo/Homerepoimple.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/model/character_model/character_model.dart';
part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit(this.homerepoimple) : super(CharacterInitial());

  final Homerepoimple homerepoimple;
  Future<void> featchCharacter() async {
    emit(CharacterLoading());
    var result = await homerepoimple.featchCharacter();
    result.fold((failur) => emit(CharacterFailur(failur.erroMessage)),
        (character) => emit(CharacterSuccfuly(character)));
  }
}
