import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MoviesList extends StatefulWidget {
  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4 - 48,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemExtent: 140,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Expanded(
                    flex: 7,
                    child: Image.network(
                      '',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        "",
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
                              "8",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          FittedBox(
                            child: RatingBar.builder(
                              initialRating: 4,
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
          }),
    );
  }
}
