import '../../controller/data_helper.dart';
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
      movies = MoviesGrid();
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
        leading: const IconButton(
          onPressed: DataHelper.eraseCache,
          icon: Icon(Icons.cleaning_services_rounded),
          tooltip: 'Clean cache.',
        ),
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
