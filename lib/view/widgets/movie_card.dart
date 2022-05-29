import '../../model/movie.dart';
import '../screens/movie_screen.dart';
import '../widgets/poster_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MovieScreen(movieId: movie.id)),
      ),
      child: Card(
        shadowColor: const Color.fromARGB(228, 1, 180, 228),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
        color: const Color.fromARGB(227, 0, 96, 122),
        child: Stack(
          fit: StackFit.expand,
          children: [
            PosterCachedNetworkImage(
              posterUrl: movie.poster,
              cacheKey: movie.id.toString(),
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
      ),
    );
  }
}
