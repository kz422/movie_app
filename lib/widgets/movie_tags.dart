import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/extension/movie_type_extension.dart';
import 'package:movie_app/providers/movie_provider.dart';

class MovieTags extends ConsumerWidget {
  const MovieTags({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var movieType = ref.watch(movieTypeProvider);
    final mt = ref.read(movieTypeProvider);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: MovieType.values
            .map(
              (type) => InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Chip(label: Text(type.name)),
                ),
                onTap: () {
                  movieType = type;
                  print(movieTypeProvider.state);
                  print(movieType);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
