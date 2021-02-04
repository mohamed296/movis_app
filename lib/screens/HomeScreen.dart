import 'package:flutter/material.dart';
import 'package:movis_app/providers/genres_provider.dart';
import 'package:movis_app/providers/movies_providers.dart';
import 'package:movis_app/widgets/Tranding_Movies.dart';
import 'package:movis_app/widgets/movies_by_genre.dart';
import 'package:movis_app/widgets/now_playing.dart';
import 'package:movis_app/widgets/tranding_persond.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool firstRun, succeful;
  @override
  void initState() {
    super.initState();
    firstRun = true;
    succeful = false;
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (firstRun) {
      List<bool> responses = await Future.wait([
        Provider.of<MoviesProviders>(context, listen: false)
            .fatchNowPlayingMovies(),
        Provider.of<GenresProvider>(context, listen: false).fetchGenres(),
      ]);

      setState(() {
        succeful = !responses.any((element) => element == false);
        firstRun = false;
      });
    }
  }

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
      body: (firstRun)
          ? Center(child: CircularProgressIndicator())
          : (succeful)
              ? ListView(
                  children: [
                    NowPlaying(),
                    MoviesByGenre(),
                    // TrandingMovies(),
                    // TrandingPersons(),
                  ],
                )
              : Center(
                  child: Text(
                    "Error has occurred",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
    );
  }
}
