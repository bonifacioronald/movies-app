import 'package:flutter/material.dart';

import '../models/colors.dart' as custom_color;

class SearcBar extends StatelessWidget {
  const SearcBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12),
      height: 44,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
          color: custom_color.backgroundPrimary),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Search Movie...',
              style: TextStyle(color: Colors.white.withOpacity(0.4)),
            ),
            Icon(
              Icons.search_rounded,
              color: Colors.white.withOpacity(0.4),
            )
          ],
        ),
      ),
    );
  }
}
