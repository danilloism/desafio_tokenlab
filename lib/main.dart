import 'package:desafio_tokenlab/view/tmdb_top_rated_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const TmdbFavourites());
}

class TmdbFavourites extends StatelessWidget {
  const TmdbFavourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TmdbTopRatedScreen(),
    );
  }
}
