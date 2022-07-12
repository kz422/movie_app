enum MovieType {
  popular,
  latest,
  nowPlaying,
  topRated,
  upcoming,
}

extension MovieTypeExtension on MovieType {
  String get value => toString().split('.').last;
  String get name {
    String name;
    switch (this) {
      case MovieType.popular:
        name = 'Popular';
        break;
      case MovieType.latest:
        name = "Latest";
        break;
      case MovieType.nowPlaying:
        name = "Now Playing";
        break;
      case MovieType.topRated:
        name = "Top rated";
        break;
      case MovieType.upcoming:
        name = "Upcoming";
        break;
    }
    return name;
  }
}
