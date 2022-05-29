import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_file_store/dio_cache_interceptor_file_store.dart';
import 'package:tmdb_favorites/model/movie.dart';
import 'package:tmdb_favorites/settings.dart';

class MovieRepository {
  final _http = Dio()
    ..interceptors.add(
      DioCacheInterceptor(
        options: CacheOptions(
          store: FileCacheStore(Settings.cacheDir.path),
          policy: CachePolicy.request,
          hitCacheOnErrorExcept: [401, 403],
          maxStale: const Duration(days: 7),
        ),
      ),
    );

  Future<List<Movie>> get getAll async {
    final res = await _http.get(Settings.apiUrl);
    return List.unmodifiable(
        (res.data as List).map((movie) => Movie.fromJson(movie)));
  }

  Future<Movie> getOne(int id) async {
    final res = await _http.get('${Settings.apiUrl}/$id');
    return Movie.fromJson(res.data);
  }
}
