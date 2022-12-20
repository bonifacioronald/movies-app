import 'package:flutter/material.dart';
import 'package:movies_app/models/fav_movie_thumbnail.dart';
import 'package:movies_app/models/featured_movie.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_app/providers/featured_movies.dart';
import 'package:movies_app/screens/motd_featured_movie_screen.dart';
import 'package:movies_app/screens/fetch_featured_movie_screen.dart';
import 'package:provider/provider.dart';

class AllTimeFavMovieSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<FavMovieThumbnail> _movieData =
        Provider.of<FeaturedMovies>(context).favMovieThumnails;

    List<Widget> favMovieThumbnadilWidget = _movieData.map((favMovie) {
      return GestureDetector(
        onTap: () {
          Provider.of<FeaturedMovies>(context, listen: false)
              .findMovieById(favMovie.imdbId)
              .then((value) => Navigator.of(context).pushNamed(
                    FetchFeaturedMovieScreen.routeName,
                  ));
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 0),
          width: 780,
          height: 1170,
          child: FadeInImage(
            placeholder: AssetImage('assets/images/loading_potrait.png'),
            image: NetworkImage(favMovie.posterUrl),
          ),
          // child: Image.network(favMovie.posterUrl),
        ),
      );
    }).toList();

    return CarouselSlider(
      items: favMovieThumbnadilWidget,
      options: CarouselOptions(
        viewportFraction: 0.4,
        scrollDirection: Axis.horizontal,
        enlargeCenterPage: true,
      ),
    );
  }
}
