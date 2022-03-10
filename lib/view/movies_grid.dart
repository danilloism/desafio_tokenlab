import 'package:desafio_tokenlab/controllers/data_helper.dart';
import 'package:desafio_tokenlab/view/movie_card.dart';
import 'package:flutter/material.dart';

class MoviesGrid extends StatelessWidget {
  MoviesGrid({Key? key}) : super(key: key);

  final dataHelper = DataHelper.getInstance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DataHelper.movies,
        builder: (context, AsyncSnapshot<List> movies) {
          if (movies.connectionState == ConnectionState.done) {
            if (!movies.hasError) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (_, index) =>
                    MovieCard(movie: movies.data![index]),
                itemCount: movies.data!.length,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
              );
            } else {
              return Text(movies.error.toString());
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
