import 'package:flutter/material.dart';

import '../../models/comic.dart';



class ComicCard extends StatelessWidget {
  final Comic comic;

  const ComicCard({super.key, required this.comic});

  @override
  Widget build(BuildContext context) {
    return Card(
      
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              comic.thumbnailUrl,
              fit: BoxFit.fill,
            ),
          ),
   
        ],
      ),
    );
  }
}
