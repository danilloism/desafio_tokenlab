import 'package:desafio_tokenlab/controllers/cache_manager.dart';
import 'package:desafio_tokenlab/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final cacheManager = CacheManager.getInstance;

  MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: const Color.fromARGB(228, 1, 180, 228),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      color: const Color.fromARGB(227, 0, 96, 122),
      child: Stack(
        fit: StackFit.expand,
        // alignment: Alignment.center,
        children: [
          Container(
            child: cacheManager.cachedImages[movie.id],
          ),
          Positioned(
            top: 120,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(235, 91, 146, 161),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 170,
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  movie.title,
                  style: GoogleFonts.sourceSansPro(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
