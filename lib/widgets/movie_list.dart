import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/config.dart';
import 'package:movie_app/extension/movie_type_extension.dart';
import 'package:movie_app/providers/movie_provider.dart';

class MovieList extends ConsumerWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(moviesProvider);
    return asyncValue.maybeWhen(
      data: (movies) => Center(
        child: GridView.builder(
          itemCount: movies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (_, i) {
              final movie = movies[i];
              return InkWell(
                onTap: () {},
                child: Card(
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    '${EnvironmentConfig.IMAGE_BASE_URL}${movie.posterPath}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(movie.title ?? 'No title')
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
      orElse: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
