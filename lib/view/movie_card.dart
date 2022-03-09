import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Card(
        shadowColor: const Color.fromARGB(228, 1, 180, 228),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
        color: const Color.fromARGB(227, 0, 96, 122),
        // margin: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'cache/poster.jpg',
                  ),
                  fit: BoxFit.fitHeight,
                  isAntiAlias: true,
                  filterQuality: FilterQuality.high,
                  alignment: Alignment.centerLeft,
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10)),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'The Godfather',
                  style: GoogleFonts.sourceSansPro(
                    color: const Color.fromARGB(225, 129, 209, 231),
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Clique no card para mais informações.',
                  style: GoogleFonts.sourceSansPro(
                    color: const Color.fromARGB(225, 129, 209, 231),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
