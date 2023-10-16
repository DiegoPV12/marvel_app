import 'package:marvel_app/models/character.dart';
import 'package:flutter/material.dart';
import '../services/marvel_service.dart';
import '../widgets/cards/character_card.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  late List<Character> characters = [];
  final MarvelService marvelService = MarvelService();

  _searchCharacters(String query) async {
    try {
      final fetchedCharacters = await marvelService.searchCharacters(query);
      setState(() {
        characters = fetchedCharacters;
      });
    } catch (e) {
      print(e);
      setState(() {
        characters = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/MarvelLogo.png',
          fit: BoxFit.contain,
          height: 50,
        ),
        backgroundColor: Colors.white12,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Busca a un personaje',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                if (value.trim().isNotEmpty) {
                  _searchCharacters(value);
                } else {
                  setState(() {
                    characters = [];
                  });
                }
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: characters.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => CharacterCard(character: characters[index]),
            ),
          ),
        ],
      ),
    );
  }
}
