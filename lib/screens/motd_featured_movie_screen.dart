import 'package:flutter/material.dart';
import 'package:movies_app/models/featured_movie.dart';
import 'package:movies_app/screens/movie_detail_screen.dart';
import 'package:movies_app/widgets/gradient_image_stack.dart';

import '../models/colors.dart' as custom_color;

class FeaturedMovieScreen extends StatelessWidget {
  static const routeName = '/featured-movie';

  const FeaturedMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FeaturedMovie _movieData =
        ModalRoute.of(context)!.settings.arguments as FeaturedMovie;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: custom_color.backgroundPrimary,
        title: const Text(
          'Movie of The Day',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: custom_color.backgroundPrimary,
          height: 740,
          child: Column(
            children: [
              Container(
                  color: custom_color.backgroundPrimary,
                  width: double.infinity,
                  height: (size.width / 780 * 1170),
                  child: GradientImageStack(
                    imageUrl: _movieData.posterUrl,
                    endPoint: 1,
                    isPotrait: true,
                  )),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: custom_color.backgroundPrimary,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Text(
                          '${_movieData.title} (${_movieData.year})',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${_movieData.genre.toString().replaceAll('[', '').replaceAll(']', '')} | ${_movieData.duration} min',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.5),
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    'IMDb ${(_movieData.rating / 10).toStringAsFixed(1)}/10',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.5),
                                        fontSize: 16),
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: () => Navigator.of(context).pushNamed(
                                    MovieDetailScreen.routeName,
                                    arguments: _movieData),
                                child: Container(
                                  width: 100,
                                  height: double.infinity,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                    ),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.keyboard_arrow_right_rounded,
                                      color: custom_color.backgroundPrimary,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
