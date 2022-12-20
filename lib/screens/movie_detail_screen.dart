import 'package:flutter/material.dart';
import 'package:movies_app/models/featured_movie.dart';
import 'package:movies_app/models/streaming_platform.dart';
import 'package:movies_app/providers/streaming_platforms.dart';
import 'package:movies_app/widgets/gradient_image_stack.dart';
import 'package:movies_app/widgets/movie_streaming_detail_card.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../models/colors.dart' as custom_color;

class MovieDetailScreen extends StatelessWidget {
  static const routeName = '/movie-details';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FeaturedMovie _movieData =
        ModalRoute.of(context)!.settings.arguments as FeaturedMovie;

    List<MovieStreamingDetailCard> _streamingCards = [];
    _movieData.streaming.forEach((id, url) {
      StreamingPlatform loadedPlatform =
          Provider.of<StreamingPlatforms>(context)
              .findStreamingPlatformById(id);
      _streamingCards.add(MovieStreamingDetailCard(loadedPlatform, url));
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: custom_color.backgroundPrimary,
        title: const Text(
          'Movies App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24.0),
            child: Center(
              child: Text(
                '?',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: custom_color.backgroundPrimary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Backdrop Image Gradient, Poster Image, Movie Details
              Container(
                width: double.infinity,
                height: (size.width / 1280 * 720 + 120),
                child: Stack(
                  children: [
                    //Backgrop Image Gradient
                    Column(
                      children: [
                        Container(
                          height: (size.width / 1280 * 720),
                          child: Stack(
                            children: [
                              GradientImageStack(
                                imageUrl: _movieData.backdropUrl,
                                endPoint: 0.8,
                                isPotrait: false,
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 120,
                          color: custom_color.backgroundPrimary,
                        )
                      ],
                    ),

                    //Poster Image & Movie Details
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 220,
                        padding: const EdgeInsets.all(24),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Material(
                                elevation: 4,
                                child: Image.network(_movieData.posterUrl),
                              ),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    _movieData.title,
                                    softWrap: true,
                                    // overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${_movieData.genre.toString().replaceAll('[', '').replaceAll(']', '')} | ${_movieData.duration} min',
                                    softWrap: true,
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.5),
                                        fontSize: 16),
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            '${(_movieData.rating / 10).toStringAsFixed(1)}',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'IMDb',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 24,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            _movieData.imdbVoteCount.toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Votes',
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                fontSize: 16),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ReadMoreText(
                  _movieData.overview,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 16,
                      height: 1.5),
                  textAlign: TextAlign.justify,
                  trimLines: 4,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Read More',
                  trimExpandedText: 'Show less',
                  colorClickableText: Colors.white,
                  moreStyle: const TextStyle(
                      color: Colors.white, fontSize: 16, height: 1.5),
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24.0),
                child: Text(
                  'Available in Indonesia on',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                height: 120,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _streamingCards.length,
                    itemBuilder: (_, index) {
                      return Row(
                        children: [
                          SizedBox(
                            width: index == 0 ? 24 : 0,
                          ),
                          SizedBox(
                            width:
                                (index != 0 && index != _streamingCards.length)
                                    ? 12
                                    : 0,
                          ),
                          _streamingCards[index],
                          SizedBox(
                            width: index == _streamingCards.length - 1 ? 24 : 0,
                          )
                        ],
                      );
                    }),
              ),
              const SizedBox(
                height: 48,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24.0),
                child: Text(
                  'Additional Information',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AdditionalInfoColumn(
                            _movieData.year.toString(), 'Release Year'),
                        AdditionalInfoColumn(_movieData.imdbId, 'IMDb ID'),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    _movieData.cast.isNotEmpty
                        ? AdditionalInfoColumn(
                            _movieData.cast
                                .toString()
                                .replaceAll('[', '')
                                .replaceAll(']', ''),
                            'Movie Casts')
                        : Container(),
                    const SizedBox(
                      height: 24,
                    ),
                    _movieData.tagline.isNotEmpty
                        ? AdditionalInfoColumn(_movieData.tagline, 'Tagline')
                        : Container(),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdditionalInfoColumn extends StatelessWidget {
  String value;
  String desc;

  AdditionalInfoColumn(this.value, this.desc);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          textAlign: TextAlign.justify,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          desc,
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
