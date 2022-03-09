import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CacheManager {
  CacheManager._();
  static final getInstance = CacheManager._();

  // static Future<void> get eraseCache async {
  //   _prefs = await SharedPreferences.getInstance();
  //   _prefs.remove('data');
  //   _prefs.setBool('cached', false);
  // }
  final _cachedImages = <CachedNetworkImage>{};
  final _ids = <int>{};

  Set<CachedNetworkImage> get cachedImages => Set.unmodifiable(_cachedImages);

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

  // Future<File> get _completeJsonFile async {
  //   final localPath = await _localDataDirectoryPath;
  //   return File('$localPath/completeFetchedData.json');
  // }

  Future<File> _movieJsonFile(int id) async {
    final localPath = await _localDataDirectoryPath;
    return File('$localPath/movie_$id.json');
  }

  Future<File> _cacheMovie(dynamic movie) async {
    final movieId = movie['id'];
    final cachedMoviePoster = CachedNetworkImage(
      imageUrl: movie['poster_url'] as String,
      cacheKey: movieId.toString(),
      filterQuality: FilterQuality.high,
      errorWidget: (_, url, error) => Column(
        children: [
          const Icon(Icons.error),
          Text(url),
          Text(error.toString()),
        ],
      ),
      placeholder: (_, __) => const Center(child: CircularProgressIndicator()),
      alignment: Alignment.centerLeft,
      fit: BoxFit.fitHeight,
    );
    _ids.add(movieId);
    _cachedImages.add(cachedMoviePoster);
    final file = await _movieJsonFile(movieId);
    final movieJson = json.encode(movie);

    return file.writeAsString(movieJson);
  }

  Future<void> cacheCompleteFetchedData(String data) async {
    List dataAsList = json.decode(data);

    for (var movie in dataAsList) {
      _cacheMovie(movie);
    }

    _writePrefsFile(cached: true);
  }

  Future<bool> get isDataCached async {
    final prefsFile = await _prefsFile;
    final prefsData = json.decode(await prefsFile.readAsString());
    bool cached = prefsData['cached'] ?? false;
    return cached;
  }

  Future<Set> get data async {
    final data = _ids.map(
      (id) async {
        final movie = await _movieJsonFile(id);
        return json.decode(await movie.readAsString());
      },
    ).toSet();

    return data;
  }
}
