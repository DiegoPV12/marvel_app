
import 'package:flutter/material.dart';

import '../../models/character.dart';
import '../cards/character_card.dart';


class CharacterListView extends StatelessWidget {
  final List<Character> characters;

  const CharacterListView({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 50, left: 20, bottom: 20),
          child: Text(
            "POPULAR MARVEL'S CHARACTERS",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 180, 
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: characters.length,
            itemBuilder: (context, index) => CharacterCard(character: characters[index]),
          ),
        ),
      ],
    );
  }
}
