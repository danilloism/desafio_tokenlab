import 'package:desafio_tokenlab/controllers/api_manager.dart';
import 'package:desafio_tokenlab/controllers/data_manager.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class TmdbFavouritesScreen extends StatelessWidget {
  const TmdbFavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder(
      future: DataManager().movies,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          //print(snapshot.data!);
          //print(snapshot.data!);
          print(snapshot);
          return const Center();
        } else if (snapshot.hasError) {
          snapshot.error.toString();
          return const Center();
        }
        return Center(
          child: Text(snapshot.error.toString()),
        );
      },
    ));
  }
}
