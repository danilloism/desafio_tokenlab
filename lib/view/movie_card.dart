import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_tokenlab/models/cache_manager.dart';
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
          CachedNetworkImage(
            imageUrl: movie.poster,
            cacheKey: movie.id.toString(),
            filterQuality: FilterQuality.high,
            imageBuilder: (_, imageProvider) => DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  isAntiAlias: true,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            errorWidget: (_, url, error) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.error),
                if (error.toString().contains('404')) ...[
                  const Text(
                    'Erro 404. O recurso que você está buscando não existe... :(',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Tente atualizar a página ou apagar o cache. Se ainda assim o problema persistir, contate o TMDB.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ] else ...[
                  Text(error.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ],
            ),
            placeholder: (_, __) =>
                const Center(child: CircularProgressIndicator()),
            // alignment: Alignment.centerLeft,
            //fit: BoxFit.cover,
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
