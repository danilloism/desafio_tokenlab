import 'package:desafio_tokenlab/controllers/api_manager.dart';
import 'package:desafio_tokenlab/controllers/cache_manager.dart';
import 'package:desafio_tokenlab/models/movie.dart';

class DataManager {
  DataManager._();
  static final getInstance = DataManager._();

  static Future<List> get data async {
    final cacheManager = CacheManager.getInstance;

    final isCached = await cacheManager.isDataCached;
    // if (isCached) {
    //   return await cacheManager.data;
    // }
    final data = await ApiManager.data;
    cacheManager.cacheCompleteFetchedData(data);
    return await ApiManager.dataAsList;
  }

  final _movies = <dynamic>[];

  // //List<Movie> get movies => List.unmodifiable(_movies);

  // Future<List<dynamic>> get _decodeData async => jsonDecode(await dataAsString);

  Future<List<Object?>> get movies async {
    final dataAsList = await data;

    final movies = dataAsList.map((e) => Movie.fromJson(e)).toList();

    _movies.addAll(movies);
    return _movies;
  }
}
