import 'package:desafio_tokenlab/view/movies_list.dart';
import 'package:flutter/material.dart';

class TmdbFavouritesScreen extends StatelessWidget {
  const TmdbFavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 37, 65),
      body: MoviesList(),
    );
  }
}
