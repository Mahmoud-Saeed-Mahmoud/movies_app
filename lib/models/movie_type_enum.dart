enum MovieTypeEnum {
  nowPlaying,
  topRated,
  popular,
  upcoming;

  @override
  String toString() {
    switch (this) {
      case MovieTypeEnum.nowPlaying:
        return 'Now Playing';
      case MovieTypeEnum.topRated:
        return 'Top Rated';
      case MovieTypeEnum.popular:
        return 'Popular';
      case MovieTypeEnum.upcoming:
        return 'Upcoming';
    }
  }
}
