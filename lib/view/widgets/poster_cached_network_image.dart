import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PosterCachedNetworkImage extends StatelessWidget {
  const PosterCachedNetworkImage({
    Key? key,
    required this.posterUrl,
    required this.cacheKey,
    this.alignment,
    this.fit,
  }) : super(key: key);
  final String posterUrl;
  final String cacheKey;
  final Alignment? alignment;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      alignment: alignment ?? Alignment.center,
      fit: fit ?? BoxFit.cover,
      imageUrl: posterUrl,
      cacheKey: cacheKey,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Icon(
            Icons.error,
            color: Colors.white,
          ),
          if (error.toString().contains('404')) ...[
            Text(
              'Erro 404. Tudo indica que esse poster não existe mais no servidor... :(',
              textAlign: TextAlign.center,
              style: GoogleFonts.sourceSansPro(
                // fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ] else ...[
            Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ],
      ),
      placeholder: (_, __) => const Center(child: CircularProgressIndicator()),
    );
  }
}
