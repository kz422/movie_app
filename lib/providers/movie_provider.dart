import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/config.dart';
import 'package:movie_app/extension/movie_type_extension.dart';
import 'package:movie_app/model/movie_model.dart';

final dioProvider = Provider<Dio>(
  (ref) => Dio(
    BaseOptions(baseUrl: EnvironmentConfig.BASE_URL),
  ),
);

final movieTypeProvider = StateProvider((ref) => MovieType.upcoming);

final moviesProvider = FutureProvider<List<Movie>>((ref) async {
  final movieType = ref.watch(movieTypeProvider);
  final dio = ref.watch(dioProvider);
  final response = await dio.get('movie/${movieType.value}',
      queryParameters: {'api_key': EnvironmentConfig.API_KEY});
  return MovieResponse.fromJson(response.data).results;
});
