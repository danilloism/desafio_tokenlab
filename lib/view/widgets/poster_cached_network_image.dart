import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_tokenlab/controller/error_message.dart';
import 'package:flutter/material.dart';

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Icon(
            Icons.error,
            color: Colors.white,
          ),
          if (error.toString().contains('404')) ...[
            ErrorMessage.error(404)
          ] else if (error.toString().contains('500')) ...[
            ErrorMessage.error(500)
          ] else ...[
            ErrorMessage.error(0)
          ],
        ],
      ),
      placeholder: (_, __) => const Center(child: CircularProgressIndicator()),
    );
  }
}
