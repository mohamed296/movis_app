import 'package:flutter/material.dart';
import 'package:movis_app/widgets/persons_list.dart';

class TrandingPersons extends StatefulWidget {
  @override
  _TrandingPersonsState createState() => _TrandingPersonsState();
}

class _TrandingPersonsState extends State<TrandingPersons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 10),
      child: Column(
        children: [
          Text(
            'Tranding Persons',
            style: Theme.of(context).textTheme.headline6,
          ),
          PersonsList(),
        ],
      ),
    );
  }
}
