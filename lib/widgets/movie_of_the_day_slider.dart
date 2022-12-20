import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/featured_movie.dart';
import 'package:movies_app/providers/featured_movies.dart';
import 'package:provider/provider.dart';

import 'movie_of_the_day_item.dart';

class MovieOfTheDaySlider extends StatefulWidget {
  const MovieOfTheDaySlider({Key? key}) : super(key: key);

  @override
  State<MovieOfTheDaySlider> createState() => _MovieOfTheDaySliderState();
}

class _MovieOfTheDaySliderState extends State<MovieOfTheDaySlider> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<FeaturedMovie> _movieOfTheDayData =
        Provider.of<FeaturedMovies>(context, listen: false).moviesOfTheDay;

    List<MovieOfTheDayItem> _movieOfTheDayItems = [];

    for (var movieData in _movieOfTheDayData) {
      _movieOfTheDayItems.add(MovieOfTheDayItem(movieData));
    }

    Size size = MediaQuery.of(context).size;

    return Container(
      height: (size.width / 1280 * 720),
      width: double.infinity,
      child: Stack(children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: PageView(
            children: _movieOfTheDayItems,
            onPageChanged: (index) {
              setState(() {
                pageIndex = index;
              });
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 24.0, bottom: 8),
            child: CarouselIndicator(
              count: _movieOfTheDayItems.length,
              index: pageIndex,
              width: 12,
              animationDuration: 0,
            ),
          ),
        ),
      ]),
    );
  }
}
