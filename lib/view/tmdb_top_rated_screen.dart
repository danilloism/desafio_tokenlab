import 'package:desafio_tokenlab/view/movies_grid.dart';
import 'package:flutter/material.dart';

class TmdbTopRatedScreen extends StatelessWidget {
  const TmdbTopRatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 37, 65),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TMDB Top Rated'),
      ),
      body: MoviesGrid(),
    );
  }
}
