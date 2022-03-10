import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_tokenlab/models/api_service.dart';
import 'package:path_provider/path_provider.dart';

class CacheManager {
  CacheManager._();
  static final getInstance = CacheManager._();

  Future<String> get _localDataDirectoryPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _prefsFile async {
    final localPath = await _localDataDirectoryPath;
    return File('$localPath/prefs.json');
  }

  Future<File> _writePrefsFile({required bool cached}) async {
    final prefsFile = await _prefsFile;

    return prefsFile.writeAsString(json.encode({'cached': cached}));
  }

  Future<File> get _moviesFile async {
    final localPath = await _localDataDirectoryPath;
    return File('$localPath/movies.json');
  }

  Future<File> _writeMoviesFile(String data) async {
    final file = await _moviesFile;
    return file.writeAsString(data);
  }

  Future<bool> get isDataCached async {
    final prefsFile = await _prefsFile;
    final fileExists = await prefsFile.exists();

    if (!fileExists) return false;

    final prefsData = await prefsFile.readAsString();
    final prefsDataDecoded = json.decode(prefsData);
    return prefsDataDecoded['cached'];
  }

  Future<void> writeCache(String data) async {
    final List dataJson = json.decode(data);
    // final List<Map<String,dynamic>> completeMovieData = [];

    for (var movie in dataJson) {
      final movieData = await ApiService.movieData(movie['id']);
      final movieDataDecoded = json.decode(movieData);
      movie['description'] = movieDataDecoded['overview'];
    }

    Future.wait<File>([
      _writePrefsFile(cached: true),
      _writeMoviesFile(json.encode(dataJson)),
    ]);
  }

  Future<void> get eraseCache async {
    final file = await _moviesFile;
    final cache = await data;
    final isCached = await isDataCached;
    final List cacheDecoded = json.decode(cache);

    if (isCached) {
      await file.delete();
      await _writePrefsFile(cached: false);

      for (var movie in cacheDecoded) {
        CachedNetworkImage.evictFromCache(movie['poster_url'] as String);
      }
    }
  }

  Future<String> get data async {
    final file = await _moviesFile;
    if (await isDataCached) return await file.readAsString();
    return '';
  }
}
