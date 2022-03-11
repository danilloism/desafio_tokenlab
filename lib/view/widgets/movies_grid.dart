import 'package:desafio_tokenlab/controller/data_helper.dart';
import 'package:desafio_tokenlab/view/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoviesGrid extends StatelessWidget {
  const MoviesGrid({Key? key}) : super(key: key);

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
              return Text(
                movies.error.toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.sourceSansPro(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
