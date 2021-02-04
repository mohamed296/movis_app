import 'package:flutter/material.dart';
import 'package:movis_app/models/Tmdb_handel.dart';
import 'package:movis_app/models/genar.dart';

class GenresProvider with ChangeNotifier {
  List<Genre> genres;
  Future<bool> fetchGenres() async {
    try {
      genres = await TMDBHandler.instance.getgenre();
      return true;
    } catch (error) {
      return false;
    }
  }
}
