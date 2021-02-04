import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movis_app/models/movie.dart';
import 'package:movis_app/providers/movies_providers.dart';
import 'package:provider/provider.dart';

class MoviesList extends StatefulWidget {
  final int genreId;
  MoviesList.byGenre(this.genreId);
  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  bool firstRun, successful;
  @override
  void initState() {
    super.initState();
    firstRun = true;
    successful = false;
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (firstRun) {
      bool done = await Provider.of<MoviesProviders>(context, listen: false)
          .fatchMoviesByGenre(widget.genreId);
          if(mounted){
            setState(() { 
        firstRun = false;
        successful = done;
       
      });
          }
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4 - 48,
      width: MediaQuery.of(context).size.width,
      child: (firstRun)
          ? Center(child: CircularProgressIndicator())
          : (successful)
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemExtent: 140,
                  itemBuilder: (context, index) {
                    Movie movie = Provider.of<MoviesProviders>(context)
                        .moviesbygenre[index];
                    return Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Image.network(
                              movie.posterurl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: Text(
                                movie.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  FittedBox(
                                    child: Text(
                                      "${movie.rating}",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  FittedBox(
                                    child: RatingBar.builder(
                                      initialRating: movie.rating / 2,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: EdgeInsets.all(4),
                                      itemBuilder: (context, index) {
                                        return Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        );
                                      },
                                      ignoreGestures: true,
                                      onRatingUpdate: null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })
              : Center(
                  child: Text(
                  "Error has occurred ",
                  style: TextStyle(color: Colors.white),
                )),
    );
  }
}
