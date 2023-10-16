import 'package:flutter/material.dart';

import '../../models/comic.dart';
import '../cards/comic_card.dart';

class ComicListView extends StatelessWidget {
  final List<Comic> comics;

  const ComicListView({Key? key, required this.comics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 0, left: 20, bottom: 20),
          child: Text(
            "MARVEL'S COMICS",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 600, 
          child: GridView.builder(
            
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, 
              childAspectRatio: 0.6,
            ),
            itemCount: comics.length,
            itemBuilder: (context, index) => ComicCard(comic: comics[index]),
          ),
        ),
      ],
    );
  }
}
