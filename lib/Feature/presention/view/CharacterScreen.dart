import 'package:app_flutter/Feature/data/repo/Homerepoimple.dart';
import 'package:app_flutter/Feature/presention/manager/cubit/character_cubit.dart';
import 'package:app_flutter/Feature/presention/view/widget/CustomGridView.dart';
import 'package:app_flutter/Feature/presention/view/widget/show_erro_message.dart';
import 'package:app_flutter/util/Service_locator.dart';
import 'package:app_flutter/util/myColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/character_model/character_model.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  List<CharacterModel> allCharacter = [];
  List<CharacterModel> filterCharacter = [];
  bool _isSearching = false;
  TextEditingController textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            CharacterCubit(getIt.get<Homerepoimple>())..featchCharacter(),
        child: Scaffold(
          backgroundColor: myColor.kgrey,
          appBar: AppBar(
            backgroundColor: myColor.kYellow,
            leading: _isSearching == true
                ? const BackButton(
                    color: myColor.kgrey,
                  )
                : Container(),
            title: _isSearching == false
                ? Text(
                    'Character',
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                : _CustomTextFiled(),
            actions: _buildicon(),
          ),
          body: BlocBuilder<CharacterCubit, CharacterState>(
            builder: (context, state) {
              if (state is CharacterFailur) {
                return ShowerroeMessage(erroMessage: state.erroMessage);
              } else if (state is CharacterSuccfuly) {
                allCharacter = state.DataofCharacter;
                return _Showdata(state);
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  Widget _Showdata(CharacterSuccfuly state) {
    if (textcontroller.text.isNotEmpty && filterCharacter.isEmpty) {
      return Center(
        child: Text(
          'Sorry,there isn\'t data',
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.white,
              ),
        ),
      );
    }
    return CustomGridView(
        AllCharacter: textcontroller.text.isEmpty
            ? state.DataofCharacter
            : filterCharacter);
  }

  Widget _CustomTextFiled() {
    return TextField(
      controller: textcontroller,
      decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Find a Character..',
          hintStyle: TextStyle(
            color: myColor.kgrey,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          )),
      onChanged: (letterCharacter) {
        _FilterCharacter(letterCharacter.toLowerCase());
      },
    );
  }

  void _FilterCharacter(letterCharacter) {
    filterCharacter = allCharacter
        .where((singlcharacter) =>
            singlcharacter.name!.toLowerCase().startsWith(letterCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> _buildicon() {
    if (_isSearching) {
      return [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
              _stopSearching();
            },
            icon: const Icon(
              Icons.clear,
              size: 24,
              color: myColor.kgrey,
            ))
      ];
    } else {
      return [
        IconButton(
            onPressed: () {
              _startSearching();
            },
            icon: const Icon(
              Icons.search,
              size: 24,
              color: myColor.kgrey,
            ))
      ];
    }
  }

  void _startSearching() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    textcontroller.clear();
    setState(() {
      _isSearching = false;
    });
  }
}
