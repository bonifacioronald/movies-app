import 'package:flutter/material.dart';
import 'package:movies_app/providers/featured_movies.dart';
import 'package:movies_app/providers/streaming_platforms.dart';
import 'package:movies_app/screens/motd_featured_movie_screen.dart';
import 'package:movies_app/screens/fetch_featured_movie_screen.dart';
import 'package:movies_app/screens/movie_detail_screen.dart';
import 'package:provider/provider.dart';
import 'models/colors.dart' as custom_color;
import './screens/main_menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: FeaturedMovies(),
        ),
        ChangeNotifierProvider.value(
          value: StreamingPlatforms(),
        ),
      ],
      child: MaterialApp(
        title: 'Movie Streaming App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: custom_color.backgroundPrimary,
          accentColor: custom_color.backgroundAccent,
          fontFamily: 'Asap',
        ),
        home: const MainMenuScreen(),
        routes: {
          FeaturedMovieScreen.routeName: (context) =>
              const FeaturedMovieScreen(),
          FetchFeaturedMovieScreen.routeName: (context) =>
              const FetchFeaturedMovieScreen(),
          MovieDetailScreen.routeName: (context) => MovieDetailScreen(),
        },
      ),
    );
  }
}
