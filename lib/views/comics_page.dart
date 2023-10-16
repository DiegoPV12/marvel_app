import 'package:flutter/material.dart';
import '../models/comic.dart';
import '../services/marvel_service.dart';
import '../widgets/listviews/comics_list_view.dart';

class ComicsPage extends StatefulWidget {
  const ComicsPage({super.key});

  @override
  State<ComicsPage> createState() => _ComicsPageState();
}

class _ComicsPageState extends State<ComicsPage> {
  late List<Comic> comics = [];
  final MarvelService marvelService = MarvelService();

  _searchComics(String query) async {
    try {
      final fetchedComics = await marvelService.searchComics(query);
      setState(() {
        comics = fetchedComics;
      });
    } catch (e) {
      print(e);
      setState(() {
        comics = [];
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Search for comics...',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  if (value.trim().isNotEmpty) {
                    _searchComics(value);
                  } else {
                    setState(() {
                      comics = [];
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, left: 25),
              child: ComicListView(comics: comics),
            ),  
          ],
        ),
      ),
    );
  }
}
