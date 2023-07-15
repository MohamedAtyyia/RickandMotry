import 'package:app_flutter/util/AppRouter.dart';
import 'package:flutter/material.dart';

import '../../../data/model/character_model/character_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ItemCharacter extends StatelessWidget {
  const ItemCharacter({Key? key, required this.OneCharacter}) : super(key: key);

  final CharacterModel OneCharacter;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white,
          width: 4,
        ),
      ),
      child: InkWell(
        onTap: ()=> Navigator.pushNamed(context,
        
         AppRouter.kCharacterdetailsScreen,
        
            arguments: OneCharacter),
        child: GridTile(
            footer: Hero(
              tag: OneCharacter.id.toString(),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 40,
                color: Colors.black54,
                child: Text(
                  OneCharacter.name.toString(),
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: OneCharacter.image.toString(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) => Image.asset(
                'asset/animation_500_lira7mdu.gif',
                fit: BoxFit.cover,
              ),
      
              // OneCharacter.image,
            )),
      ),
    );
  }
}
