part of 'character_cubit.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

class CharacterInitial extends CharacterState {}
class CharacterLoading extends CharacterState {}
class CharacterFailur extends CharacterState {
   final String erroMessage;

 const  CharacterFailur(this.erroMessage);

}
class CharacterSuccfuly extends CharacterState {
  final List<CharacterModel>DataofCharacter;

  const CharacterSuccfuly(this.DataofCharacter);

}
