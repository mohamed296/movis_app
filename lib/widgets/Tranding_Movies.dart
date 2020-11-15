import 'package:flutter/material.dart';
import 'package:movis_app/widgets/movies_list.dart';

class TrandingMovies extends StatefulWidget {
  @override
  _TrandingMoviesState createState() => _TrandingMoviesState();
}

class _TrandingMoviesState extends State<TrandingMovies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 10),
      child: Column(
        children: [
          Text(
            "Trending Movies ",
            style: Theme.of(context).textTheme.headline6,
          ),
          MoviesList(),
        ],
      ),
    );
  }
}
