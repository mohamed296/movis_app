import 'package:flutter/material.dart';
import 'package:movis_app/widgets/Tranding_Movies.dart';
import 'package:movis_app/widgets/movies_by_genre.dart';
import 'package:movis_app/widgets/now_playing.dart';
import 'package:movis_app/widgets/tranding_persond.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.dehaze), onPressed: () {}),
        title: Text('Moovies'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: [
          NowPlaying(),
          MoviesByGenre(),
          // TrandingMovies(),
          //  TrandingPersons(),
        ],
      ),
    );
  }
}
