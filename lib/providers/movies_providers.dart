import 'package:flutter/widgets.dart';
import 'package:movis_app/models/Tmdb_handel.dart';
import 'package:movis_app/models/movie.dart';

class MoviesProviders with ChangeNotifier {
  List<Movie> nowPlaying;
  List<Movie> moviesbygenre;
  Future<bool> fatchNowPlayingMovies() async {
    try {
      nowPlaying = await TMDBHandler.instance.getNowPlaying();
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> fatchMoviesByGenre(int genreId) async {
    try {
      moviesbygenre = await TMDBHandler.instance.getmoviebygenre(genreId);
      return true;
    } catch (error) {
      return false;
    }
  }
}
