import 'package:desafio_tokenlab/controller/data_helper.dart';
import 'package:desafio_tokenlab/view/widgets/movies_grid.dart';
import 'package:flutter/material.dart';

class TmdbTopRatedScreen extends StatelessWidget {
  const TmdbTopRatedScreen({Key? key}) : super(key: key);

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
            onPressed: () {},
            icon: const Icon(Icons.refresh_rounded),
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
      body: const MoviesGrid(),
    );
  }
}
