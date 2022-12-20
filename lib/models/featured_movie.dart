class FeaturedMovie {
  String imdbId;
  String title;
  String backdropUrl;
  String posterUrl;
  int year;
  List<String> genre;
  int duration;
  double rating;
  String overview;
  int imdbVoteCount;
  String tagline;
  List<String> cast;
  Map<String, String> streaming;

  FeaturedMovie({
    required this.imdbId,
    required this.title,
    required this.backdropUrl,
    required this.posterUrl,
    required this.year,
    required this.genre,
    required this.duration,
    required this.rating,
    required this.overview,
    required this.imdbVoteCount,
    required this.tagline,
    required this.cast,
    required this.streaming,
  });
}
