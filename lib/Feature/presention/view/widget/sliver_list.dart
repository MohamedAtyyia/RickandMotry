import 'package:flutter/material.dart';

import '../../../data/model/character_model/character_model.dart';
import 'build_divider.dart';
import 'chracter_info.dart';

class BuildSliverList extends StatelessWidget {
  const BuildSliverList({super.key, required this.singelCharacter});
   final CharacterModel singelCharacter;
  @override
  Widget build(BuildContext context) {
    return  SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            margin: const EdgeInsets.only(left: 15, top: 20, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Characterinfo(
                    title: 'species',
                    value: singelCharacter.species.toString()),
                const BuildDivider(sizewidth: 60),
                Characterinfo(
                    title: 'Appeared',
                    value: singelCharacter.location!.name.toString()),
                const BuildDivider(sizewidth: 88),
                Characterinfo(
                    title: 'created',
                    value: singelCharacter.created.toString()),
                const BuildDivider(sizewidth: 65),
                Characterinfo(
                    title: 'status', value: singelCharacter.status.toString()),
                const BuildDivider(sizewidth: 55),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 1,
          )
        ],
      ),
    );
  }
}