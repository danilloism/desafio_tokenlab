import 'package:desafio_tokenlab/view/movie_card.dart';
import 'package:flutter/material.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(
          height: 1,
        ),
        itemBuilder: (_, __) => const MovieCard(),
        itemCount: 12,
      ),
    );
  }
}
