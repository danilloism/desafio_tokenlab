import 'package:desafio_tokenlab/controllers/data_manager.dart';
import 'package:desafio_tokenlab/models/movie.dart';
import 'package:desafio_tokenlab/view/movie_card.dart';
import 'package:flutter/material.dart';

class MoviesGrid extends StatelessWidget {
  MoviesGrid({Key? key}) : super(key: key);

  final dataManager = DataManager.getInstance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: dataManager.movies,
        builder: (context, AsyncSnapshot<List> movies) {
          if (movies.connectionState == ConnectionState.done) {
            return GridView.builder(
              // itemBuilder: (_, __) => const MovieCard(),

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),

              itemBuilder: (_, index) => MovieCard(movie: movies.data![index]),
              itemCount: movies.data!.length,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
