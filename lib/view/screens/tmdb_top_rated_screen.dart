import '../widgets/movies_grid.dart';
import 'package:flutter/material.dart';

class TmdbTopRatedScreen extends StatefulWidget {
  const TmdbTopRatedScreen({Key? key}) : super(key: key);

  @override
  State<TmdbTopRatedScreen> createState() => _TmdbTopRatedScreenState();
}

class _TmdbTopRatedScreenState extends State<TmdbTopRatedScreen> {
  MoviesGrid movies = const MoviesGrid();

  void _onRefreshButtonTapped() {
    setState(() {
      movies = const MoviesGrid();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _onRefreshButtonTapped,
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Refresh page.',
          )
        ],
        title: SizedBox(
          height: 45,
          child: Image.asset(
            'assets/logo.png',
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
      body: movies,
    );
  }
}
