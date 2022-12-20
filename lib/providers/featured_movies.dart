import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api/api_key.dart' as api;
import 'package:flutter/material.dart';
import 'package:movies_app/models/fav_movie_thumbnail.dart';
import 'package:movies_app/models/featured_movie.dart';
import 'package:movies_app/models/genres.dart';

class FeaturedMovies with ChangeNotifier {
  List<FeaturedMovie> _moviesOfTheDay = [
    FeaturedMovie(
        imdbId: 'tt101',
        title: '2 Weeks in Lagos',
        backdropUrl:
            'https://image.tmdb.org/t/p/original/5KmhjlR5CEarB8mKtpjcjHRYIu9.jpg',
        posterUrl:
            'https://images.squarespace-cdn.com/content/v1/55b85014e4b07694dcf099c9/1583978159953-4YBAK6YX7IMJRBJHDMWN/image-asset.jpeg',
        year: 2021,
        genre: ['Action', 'Drama'],
        duration: 115,
        rating: 67,
        cast: ['Cast 1', 'Cast 2', 'Cast 3', 'Cast 4'],
        imdbVoteCount: 2000,
        overview:
            'In Norway on 22 July 2011, right-wing terrorist Anders Behring Breivik murdered 77 young people attending a Labour Party Youth Camp on Utöya Island outside of Oslo. This three-part story will focus on the survivors of the attacks, the political leadership of Norway, and the lawyers involved.',
        tagline: 'The true story of a day that started like any other',
        streaming: {
          'hbo':
              'https://play.hbomax.com/page/urn:hbo:page:GXdu2ZAglVJuAuwEAADbA:type:feature',
          'netflix':
              'https://netflix.com/page/urn:hbo:page:GXdu2ZAglVJuAuwEAADbA:type:feature'
        }),
    FeaturedMovie(
        imdbId: 'tt101',
        title: '2 Weeks in Lagos',
        backdropUrl:
            'https://image.tmdb.org/t/p/original/5KmhjlR5CEarB8mKtpjcjHRYIu9.jpg',
        posterUrl:
            'https://images.squarespace-cdn.com/content/v1/55b85014e4b07694dcf099c9/1583978159953-4YBAK6YX7IMJRBJHDMWN/image-asset.jpeg',
        year: 2021,
        genre: ['Action', 'Drama'],
        duration: 115,
        rating: 67,
        cast: ['Cast 1', 'Cast 2', 'Cast 3', 'Cast 4'],
        imdbVoteCount: 2000,
        overview:
            'In Norway on 22 July 2011, right-wing terrorist Anders Behring Breivik murdered 77 young people attending a Labour Party Youth Camp on Utöya Island outside of Oslo. This three-part story will focus on the survivors of the attacks, the political leadership of Norway, and the lawyers involved.',
        tagline: 'The true story of a day that started like any other',
        streaming: {
          'hbo':
              'https://play.hbomax.com/page/urn:hbo:page:GXdu2ZAglVJuAuwEAADbA:type:feature',
          'netflix':
              'https://netflix.com/page/urn:hbo:page:GXdu2ZAglVJuAuwEAADbA:type:feature'
        }),
    FeaturedMovie(
        imdbId: 'tt101',
        title: '2 Weeks in Lagos',
        backdropUrl:
            'https://image.tmdb.org/t/p/original/5KmhjlR5CEarB8mKtpjcjHRYIu9.jpg',
        posterUrl:
            'https://images.squarespace-cdn.com/content/v1/55b85014e4b07694dcf099c9/1583978159953-4YBAK6YX7IMJRBJHDMWN/image-asset.jpeg',
        year: 2021,
        genre: ['Action', 'Drama'],
        duration: 115,
        rating: 67,
        cast: ['Cast 1', 'Cast 2', 'Cast 3', 'Cast 4'],
        imdbVoteCount: 2000,
        overview:
            'In Norway on 22 July 2011, right-wing terrorist Anders Behring Breivik murdered 77 young people attending a Labour Party Youth Camp on Utöya Island outside of Oslo. This three-part story will focus on the survivors of the attacks, the political leadership of Norway, and the lawyers involved.',
        tagline: 'The true story of a day that started like any other',
        streaming: {
          'hbo':
              'https://play.hbomax.com/page/urn:hbo:page:GXdu2ZAglVJuAuwEAADbA:type:feature',
          'netflix':
              'https://netflix.com/page/urn:hbo:page:GXdu2ZAglVJuAuwEAADbA:type:feature'
        }),
    FeaturedMovie(
        imdbId: 'tt101',
        title: '2 Weeks in Lagos',
        backdropUrl:
            'https://image.tmdb.org/t/p/original/5KmhjlR5CEarB8mKtpjcjHRYIu9.jpg',
        posterUrl:
            'https://images.squarespace-cdn.com/content/v1/55b85014e4b07694dcf099c9/1583978159953-4YBAK6YX7IMJRBJHDMWN/image-asset.jpeg',
        year: 2021,
        genre: ['Action', 'Drama'],
        duration: 115,
        rating: 67,
        cast: ['Cast 1', 'Cast 2', 'Cast 3', 'Cast 4'],
        imdbVoteCount: 2000,
        overview:
            'In Norway on 22 July 2011, right-wing terrorist Anders Behring Breivik murdered 77 young people attending a Labour Party Youth Camp on Utöya Island outside of Oslo. This three-part story will focus on the survivors of the attacks, the political leadership of Norway, and the lawyers involved.',
        tagline: 'The true story of a day that started like any other',
        streaming: {
          'hbo':
              'https://play.hbomax.com/page/urn:hbo:page:GXdu2ZAglVJuAuwEAADbA:type:feature',
          'netflix':
              'https://netflix.com/page/urn:hbo:page:GXdu2ZAglVJuAuwEAADbA:type:feature'
        }),
    FeaturedMovie(
        imdbId: 'tt101',
        title: '2 Weeks in Lagos',
        backdropUrl:
            'https://image.tmdb.org/t/p/original/5KmhjlR5CEarB8mKtpjcjHRYIu9.jpg',
        posterUrl:
            'https://images.squarespace-cdn.com/content/v1/55b85014e4b07694dcf099c9/1583978159953-4YBAK6YX7IMJRBJHDMWN/image-asset.jpeg',
        year: 2021,
        genre: ['Action', 'Drama'],
        duration: 115,
        rating: 67,
        cast: ['Cast 1', 'Cast 2', 'Cast 3', 'Cast 4'],
        imdbVoteCount: 2000,
        overview:
            'In Norway on 22 July 2011, right-wing terrorist Anders Behring Breivik murdered 77 young people attending a Labour Party Youth Camp on Utöya Island outside of Oslo. This three-part story will focus on the survivors of the attacks, the political leadership of Norway, and the lawyers involved.',
        tagline: 'The true story of a day that started like any other',
        streaming: {
          'hbo':
              'https://play.hbomax.com/page/urn:hbo:page:GXdu2ZAglVJuAuwEAADbA:type:feature',
          'netflix':
              'https://netflix.com/page/urn:hbo:page:GXdu2ZAglVJuAuwEAADbA:type:feature'
        }),
  ];

  List<FeaturedMovie> get moviesOfTheDay {
    return [..._moviesOfTheDay];
  }

  final List<FeaturedMovie> _favoriteMovies = [
    FeaturedMovie(
        imdbId: 'tt1375666',
        title: 'Inception',
        backdropUrl:
            'https://image.tmdb.org/t/p/w1280/ztZ4vw151mw04Bg6rqJLQGBAmvn.jpg',
        posterUrl:
            'https://image.tmdb.org/t/p/w780/edv5CZvWj09upOsy2Y6IwDhK8bt.jpg',
        year: 2010,
        genre: ['Sci-Fi', 'Fantasy'],
        duration: 148,
        rating: 88,
        overview:
            'Cobb, a skilled thief who commits corporate espionage by infiltrating the subconscious of his targets is offered a chance to regain his old life as payment for a task considered to be impossible: "inception", the implantation of another person\'s idea into a target\'s subconscious.',
        cast: [
          'Actor 1',
          'Actor 2',
          'Actor 3',
          'Actor 4',
        ],
        imdbVoteCount: 2275054,
        tagline: 'Your mind is the scene of the crime.',
        streaming: {
          'hbo':
              'https://play.hbomax.com/page/urn:hbo:page:GXdu2ZAglVJuAuwEAADbA:type:feature',
          'netflix':
              'https://netflix.com/page/urn:hbo:page:GXdu2ZAglVJuAuwEAADbA:type:feature'
        }),
    FeaturedMovie(
        imdbId: 'tt1375666',
        title: 'Inception',
        backdropUrl:
            'https://image.tmdb.org/t/p/w1280/ztZ4vw151mw04Bg6rqJLQGBAmvn.jpg',
        posterUrl:
            'https://image.tmdb.org/t/p/w780/edv5CZvWj09upOsy2Y6IwDhK8bt.jpg',
        year: 2010,
        genre: ['Sci-Fi', 'Fantasy'],
        duration: 148,
        rating: 88,
        overview:
            'Cobb, a skilled thief who commits corporate espionage by infiltrating the subconscious of his targets is offered a chance to regain his old life as payment for a task considered to be impossible: "inception", the implantation of another person\'s idea into a target\'s subconscious.',
        cast: [
          'Actor 1',
          'Actor 2',
          'Actor 3',
          'Actor 4',
        ],
        imdbVoteCount: 2275054,
        tagline: 'Your mind is the scene of the crime.',
        streaming: {
          'hbo':
              'https://play.hbomax.com/page/urn:hbo:page:GXdu2ZAglVJuAuwEAADbA:type:feature',
          'netflix':
              'https://netflix.com/page/urn:hbo:page:GXdu2ZAglVJuAuwEAADbA:type:feature'
        }),
    FeaturedMovie(
        imdbId: 'tt1375666',
        title: 'Inception',
        backdropUrl:
            'https://image.tmdb.org/t/p/w1280/ztZ4vw151mw04Bg6rqJLQGBAmvn.jpg',
        posterUrl:
            'https://image.tmdb.org/t/p/w780/edv5CZvWj09upOsy2Y6IwDhK8bt.jpg',
        year: 2010,
        genre: ['Sci-Fi', 'Fantasy'],
        duration: 148,
        rating: 88,
        overview:
            'Cobb, a skilled thief who commits corporate espionage by infiltrating the subconscious of his targets is offered a chance to regain his old life as payment for a task considered to be impossible: "inception", the implantation of another person\'s idea into a target\'s subconscious.',
        cast: [
          'Actor 1',
          'Actor 2',
          'Actor 3',
          'Actor 4',
        ],
        imdbVoteCount: 2275054,
        tagline: 'Your mind is the scene of the crime.',
        streaming: {
          'hbo':
              'https://play.hbomax.com/page/urn:hbo:page:GXdu2ZAglVJuAuwEAADbA:type:feature',
          'netflix':
              'https://netflix.com/page/urn:hbo:page:GXdu2ZAglVJuAuwEAADbA:type:feature'
        }),
    FeaturedMovie(
        imdbId: 'tt1375666',
        title: 'Inception',
        backdropUrl:
            'https://image.tmdb.org/t/p/w1280/ztZ4vw151mw04Bg6rqJLQGBAmvn.jpg',
        posterUrl:
            'https://image.tmdb.org/t/p/w780/edv5CZvWj09upOsy2Y6IwDhK8bt.jpg',
        year: 2010,
        genre: ['Sci-Fi', 'Fantasy'],
        duration: 148,
        rating: 88,
        overview:
            'Cobb, a skilled thief who commits corporate espionage by infiltrating the subconscious of his targets is offered a chance to regain his old life as payment for a task considered to be impossible: "inception", the implantation of another person\'s idea into a target\'s subconscious.',
        cast: [
          'Actor 1',
          'Actor 2',
          'Actor 3',
          'Actor 4',
        ],
        imdbVoteCount: 2275054,
        tagline: 'Your mind is the scene of the crime.',
        streaming: {
          'hbo':
              'https://play.hbomax.com/page/urn:hbo:page:GXdu2ZAglVJuAuwEAADbA:type:feature',
          'netflix':
              'https://netflix.com/page/urn:hbo:page:GXdu2ZAglVJuAuwEAADbA:type:feature'
        }),
    FeaturedMovie(
        imdbId: 'tt1375666',
        title: 'Inception',
        backdropUrl:
            'https://image.tmdb.org/t/p/w1280/ztZ4vw151mw04Bg6rqJLQGBAmvn.jpg',
        posterUrl:
            'https://image.tmdb.org/t/p/w780/edv5CZvWj09upOsy2Y6IwDhK8bt.jpg',
        year: 2010,
        genre: ['Sci-Fi', 'Fantasy'],
        duration: 148,
        rating: 88,
        overview:
            'Cobb, a skilled thief who commits corporate espionage by infiltrating the subconscious of his targets is offered a chance to regain his old life as payment for a task considered to be impossible: "inception", the implantation of another person\'s idea into a target\'s subconscious.',
        cast: [
          'Actor 1',
          'Actor 2',
          'Actor 3',
          'Actor 4',
        ],
        imdbVoteCount: 2275054,
        tagline: 'Your mind is the scene of the crime.',
        streaming: {
          'hbo':
              'https://play.hbomax.com/page/urn:hbo:page:GXdu2ZAglVJuAuwEAADbA:type:feature',
          'netflix':
              'https://netflix.com/page/urn:hbo:page:GXdu2ZAglVJuAuwEAADbA:type:feature'
        }),
    FeaturedMovie(
        imdbId: 'tt1375666',
        title: 'Inception',
        backdropUrl:
            'https://image.tmdb.org/t/p/w1280/ztZ4vw151mw04Bg6rqJLQGBAmvn.jpg',
        posterUrl:
            'https://image.tmdb.org/t/p/w780/edv5CZvWj09upOsy2Y6IwDhK8bt.jpg',
        year: 2010,
        genre: ['Sci-Fi', 'Fantasy'],
        duration: 148,
        rating: 88,
        overview:
            'Cobb, a skilled thief who commits corporate espionage by infiltrating the subconscious of his targets is offered a chance to regain his old life as payment for a task considered to be impossible: "inception", the implantation of another person\'s idea into a target\'s subconscious.',
        cast: [
          'Actor 1',
          'Actor 2',
          'Actor 3',
          'Actor 4',
        ],
        imdbVoteCount: 2275054,
        tagline: 'Your mind is the scene of the crime.',
        streaming: {
          'hbo':
              'https://play.hbomax.com/page/urn:hbo:page:GXdu2ZAglVJuAuwEAADbA:type:feature',
          'netflix':
              'https://netflix.com/page/urn:hbo:page:GXdu2ZAglVJuAuwEAADbA:type:feature'
        }),
  ];

  List<FeaturedMovie> get favoriteMovies {
    return [..._favoriteMovies];
  }

  final List<FavMovieThumbnail> _favMovieThumbnails = [];

  List<FavMovieThumbnail> get favMovieThumnails {
    return [..._favMovieThumbnails];
  }

  String ApiKey = api.ApiKey;
  String country = 'us';

  FeaturedMovie loadedMovieFromId = FeaturedMovie(
      imdbId: 'imdbId',
      title: 'title',
      backdropUrl: 'backdropUrl',
      posterUrl: 'posterUrl',
      year: 0,
      genre: [],
      duration: 0,
      rating: 0,
      overview: 'overview',
      imdbVoteCount: 0,
      tagline: 'tagline',
      cast: [],
      streaming: {});

  Future<void> findMovieById(String imdbId) async {
    var endpointUrl = 'https://streaming-availability.p.rapidapi.com/get/basic';
    var headers = {
      "X-RapidAPI-Host": "streaming-availability.p.rapidapi.com",
      "X-RapidAPI-Key": ApiKey,
    };
    Map<String, dynamic> queryParams = {
      'country': country,
      'imdb_id': imdbId,
    };
    try {
      final uri = Uri.parse(endpointUrl).replace(queryParameters: queryParams);
      final response = await http.get(uri, headers: headers);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      print(extractedData);

      List<int> genreIds = extractedData['genres'].cast<int>();
      List<String> loadedGenres = genreIdToString(genreIds);
      //Only Load First  Two Genres
      List<String> displayedGenre = [];
      if (loadedGenres.length >= 2) {
        displayedGenre.add(loadedGenres[0]);
        displayedGenre.add(loadedGenres[1]);
      } else {
        displayedGenre.add(loadedGenres[0]);
      }
      int ratingInt = extractedData['imdbRating'];
      double ratingDouble = ratingInt.toDouble();
      List<String> cast = List<String>.from(extractedData['cast'] as List);
      Map<String, dynamic> streamingPlatformList =
          extractedData['streamingInfo'];
      Map<String, String> streamingInfo = {};

      streamingPlatformList.forEach((platform, data) {
        streamingInfo.addAll({platform: data[country]['link']});
      });

      loadedMovieFromId = FeaturedMovie(
          imdbId: extractedData['imdbID'],
          title: extractedData['title'],
          backdropUrl: extractedData['backdropURLs']['1280'],
          posterUrl: extractedData['posterURLs']['780'],
          year: extractedData['year'],
          genre: displayedGenre,
          duration: extractedData['runtime'],
          rating: ratingDouble,
          overview: extractedData['overview'],
          imdbVoteCount: extractedData['imdbVoteCount'],
          tagline: extractedData['tagline'],
          cast: cast,
          streaming: streamingInfo);
    } catch (error) {
      rethrow;
    }
  }

  List<String> genreIdToString(List<int> genreIdList) {
    List<String> loadedGenreList = [];
    for (var genreId in genreIdList) {
      loadedGenreList.add(genre[genreId].toString());
    }
    return loadedGenreList;
  }

  Future<void> fetchAndSetMOTDData() async {
    var endpointUrl =
        'https://streaming-availability.p.rapidapi.com/search/basic';
    var headers = {
      "X-RapidAPI-Host": "streaming-availability.p.rapidapi.com",
      "X-RapidAPI-Key": ApiKey,
    };
    Map<String, dynamic> queryParams = {
      'country': country,
      'service': 'netflix',
      'type': 'movie',
    };
    try {
      final uri = Uri.parse(endpointUrl).replace(queryParameters: queryParams);
      final response = await http.get(uri, headers: headers);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      print(extractedData);

      List<FeaturedMovie> loadedMOTD = [];
      for (int i = 0; i < 4; i++) {
        int ratingInt = extractedData['results'][i]['imdbRating'];
        double ratingDouble = ratingInt.toDouble();
        List<int> genreIds = extractedData['results'][i]['genres'].cast<int>();
        List<String> loadedGenre = genreIdToString(genreIds);
        List<String> cast =
            List<String>.from(extractedData['results'][i]['cast'] as List);
        Map<String, dynamic> streamingPlatformList =
            extractedData['results'][i]['streamingInfo'];
        Map<String, String> streamingInfo = {};

        streamingPlatformList.forEach((platform, data) {
          streamingInfo.addAll({platform: data['us']['link']});
        });

        loadedMOTD.add(
          FeaturedMovie(
            imdbId: extractedData['results'][i]['imdbID'],
            title: extractedData['results'][i]['title'],
            backdropUrl: extractedData['results'][i]['backdropURLs']['1280'],
            posterUrl: extractedData['results'][i]['posterURLs']['780'],
            year: extractedData['results'][i]['year'],
            genre: loadedGenre,
            duration: extractedData['results'][i]['runtime'],
            rating: ratingDouble,
            overview: extractedData['results'][i]['overview'],
            imdbVoteCount: extractedData['results'][i]['imdbVoteCount'],
            tagline: extractedData['results'][i]['tagline'],
            cast: cast,
            streaming: streamingInfo,
          ),
        );
      }
      _moviesOfTheDay = loadedMOTD;
    } catch (error) {
      rethrow;
    }
  }

  Future<void> fetchAndSetFavMovieData() async {
    try {
      final url = Uri.https(
          'movie-streaming-check-app-default-rtdb.asia-southeast1.firebasedatabase.app',
          '/FavMovie.json');
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      print(extractedData);

      extractedData.forEach((movie, data) {
        _favMovieThumbnails.add(FavMovieThumbnail(
            imdbId: data['imdbId'], posterUrl: data['posterUrl']));
      });
    } catch (error) {
      rethrow;
    }
  }
}
