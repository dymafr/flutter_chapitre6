import 'package:flutter/material.dart';

import 'city_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List cities = [
    {'name': 'Paris', 'image': 'assets/images/paris.jpeg', 'checked': false},
    {'name': 'Lyon', 'image': 'assets/images/lyon.jpeg', 'checked': false},
    {'name': 'Nice', 'image': 'assets/images/nice.jpeg', 'checked': false},
  ];

  void switchChecked(city) {
    int index = cities.indexOf(city);
    setState(() {
      cities[index]['checked'] = !cities[index]['checked'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text('dymatrip'),
        actions: <Widget>[Icon(Icons.more_vert)],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ...cities.map((city) {
              return CityCard(
                name: city['name'],
                image: city['image'],
                checked: city['checked'],
                updateChecked: () {
                  switchChecked(city);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
