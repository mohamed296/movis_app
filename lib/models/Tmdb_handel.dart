import 'package:dio/dio.dart';
import 'package:movis_app/helpers/api_keys.dart';
import 'package:movis_app/models/genar.dart';
import 'package:movis_app/models/movie.dart';

class TMDBHandler {
  static TMDBHandler _instance = TMDBHandler._private();
  TMDBHandler._private();
  static TMDBHandler get instance => _instance;
  Dio _dio = Dio();
  String mainurl = 'https://api.themoviedb.org/3';

  Future<List<Movie>> getNowPlaying() async {
    String url = '$mainurl/movie/now_playing';
    final parms = {
      'api_key': ApiKeys.apikey,
    };
    Response response = await _dio.get(url, queryParameters: parms);
    List<Movie> movies = (response.data['results'] as List).map((movie) {
      return Movie.fromjson(movie);
    }).toList();
    return movies;
  }

  Future<List<Genre>> getgenre() async {
    String url = '$mainurl/genre/movie/list';
    final parms = {
      'api_key': ApiKeys.apikey,
    };
    Response response = await _dio.get(url, queryParameters: parms);
    List<Genre> genres = (response.data['genres'] as List).map((genre) {
      return Genre.fromjson(genre);
    }).toList();
    return genres;
  }

  Future<List<Movie>> getmoviebygenre(int genreId) async {
    String url = '$mainurl/discover/movie';
    final parms = {
      'api_key': ApiKeys.apikey,
      'with_genres': genreId,
    };
    Response response = await _dio.get(url, queryParameters: parms);
    List<Movie> movies = (response.data['results'] as List).map((movie) {
      return Movie.fromjson(movie);
    }).toList();
    return movies;
  }
}
