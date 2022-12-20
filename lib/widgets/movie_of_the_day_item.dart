import 'package:flutter/material.dart';
import 'package:movies_app/models/featured_movie.dart';
import 'package:movies_app/screens/motd_featured_movie_screen.dart';
import 'package:movies_app/widgets/gradient_image_stack.dart';

import '../models/colors.dart' as custom_color;

class MovieOfTheDayItem extends StatelessWidget {
  FeaturedMovie data;

  MovieOfTheDayItem(this.data);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(FeaturedMovieScreen.routeName, arguments: data),
      child: Container(
        height: (size.width / 1280 * 720),
        width: double.infinity,
        child: Stack(
          children: [
            GradientImageStack(
              imageUrl: data.backdropUrl,
              endPoint: 1,
              isPotrait: false,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              height: double.infinity,
              padding: EdgeInsets.only(left: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${data.genre.toString().replaceAll('[', '').replaceAll(']', '')} | ${data.duration} min',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5), fontSize: 12),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
