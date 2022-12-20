import 'package:flutter/material.dart';

import '../models/colors.dart' as custom_color;

class GenreFilterButton extends StatelessWidget {
  String genre;

  GenreFilterButton(this.genre);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      height: 44,
      decoration: BoxDecoration(
          color: custom_color.backgroundAccent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white.withOpacity(0.1), width: 1)),
      child: Center(
        child: Text(
          genre,
          style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12),
        ),
      ),
    );
  }
}
