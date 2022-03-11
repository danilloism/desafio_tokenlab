import 'package:desafio_tokenlab/view/tmdb_top_rated_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        scaffoldBackgroundColor: const Color.fromARGB(255, 3, 37, 65),
        textTheme: Theme.of(context)
            .textTheme
            .copyWith(bodyText2: GoogleFonts.sourceSansPro()),
      ),
      home: const TmdbTopRatedScreen(),
    );
  }
}
