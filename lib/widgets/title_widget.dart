import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/providers/movie_provider.dart';

class Title extends ConsumerWidget {
  const Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieType = ref.watch(movieTypeProvider);
    return Text('${movieType.name} movies');
  }
}
