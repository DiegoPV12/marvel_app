import 'package:flutter/material.dart';
import '../models/character.dart';
import '../models/comic.dart';
import '../services/marvel_service.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/listviews/character_list_view.dart';
import '../widgets/listviews/comics_list_view.dart';
import 'characters_page.dart';
import 'comics_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Character> characters = [];
  late List<Comic> comics = [];
  final MarvelService marvelService = MarvelService();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    try {
      final fetchedCharacters = await marvelService.fetchCharacters();
      final fetchedComics = await marvelService.fetchComics();
      setState(() {
        characters = fetchedCharacters;
        comics = fetchedComics;
      });
    } catch (e) {
      print(e);
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CharacterListView(characters: characters),
              ComicListView(comics: comics),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavBar(
        onTapCharacters: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CharactersPage()),
          );
        },
        onTapComics: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ComicsPage()),
          );
        },
      ),
    );
  }
}
