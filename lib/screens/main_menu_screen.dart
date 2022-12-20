import 'package:flutter/material.dart';
import 'package:movies_app/providers/featured_movies.dart';
import 'package:movies_app/providers/streaming_platforms.dart';
import 'package:movies_app/widgets/all_time_fav_movie_slider.dart';
import 'package:movies_app/widgets/main_menu_setting.dart';
import 'package:movies_app/widgets/movie_of_the_day_slider.dart';
import 'package:movies_app/widgets/streaming_platform_card_slider.dart';
import 'package:provider/provider.dart';

import '../models/colors.dart' as custom_color;
import '../widgets/genre_filter_button.dart';
import '../widgets/search_bar.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  List<String> genre = [
    "Action",
    "Comedy",
    "Drama",
    "Romance",
    "Fantasy",
    "Animation",
    "Biography"
  ];

  var _isLoading = false;
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<StreamingPlatforms>(context)
          .initializeSelectedSteamingPlatform();
      Provider.of<FeaturedMovies>(context, listen: false)
          .fetchAndSetMOTDData()
          .then((_) {
        Provider.of<FeaturedMovies>(context, listen: false)
            .fetchAndSetFavMovieData()
            .then((value) {
          setState(() {
            _isLoading = false;
          });
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: custom_color.backgroundPrimary,
        title: const Text(
          'Movies App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: custom_color.backgroundPrimary,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                      builder: (_) {
                        return MainMenuSetting();
                      });
                },
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 24,
                )),
          )
        ],
      ),
      body: _isLoading
          ? Container(
              width: double.infinity,
              height: double.infinity,
              color: custom_color.backgroundPrimary,
              child: Center(
                  child: CircularProgressIndicator(
                color: Colors.white.withOpacity(0.5),
              )))
          : SingleChildScrollView(
              child: Container(
                width: double.infinity,
                color: custom_color.backgroundPrimary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MovieOfTheDaySlider(),
                    const SizedBox(
                      height: 48,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: SearcBar(),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 24),
                      width: double.infinity,
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: genre.length,
                          itemBuilder: (_, index) {
                            return Row(
                              children: [
                                GenreFilterButton(genre[index]),
                                SizedBox(
                                  width: index == genre.length - 1 ? 24 : 12,
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
                        'All-time Favorites',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    AllTimeFavMovieSlider(),
                    const SizedBox(
                      height: 48,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 24.0),
                      child: Text(
                        'Supported Streaming Platforms',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    StreamingPlatformCardSlider(),
                    const SizedBox(
                      height: 48,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
