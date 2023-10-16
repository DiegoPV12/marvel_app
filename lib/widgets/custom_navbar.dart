// custom_navbar.dart

import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final Function onTapCharacters;
  final Function onTapComics;

  const CustomNavBar({super.key, 
    required this.onTapCharacters,
    required this.onTapComics,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Characters',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Comics',
        ),
      ],
      onTap: (index) {
        if (index == 0) {
          onTapCharacters();
        } else if (index == 1) {
          onTapComics();
        }
      },
    );
  }
}
