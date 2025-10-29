class SearchState {
  final String query;

  const SearchState({this.query = ''});

  SearchState copyWith({String? query}) {
    return SearchState(query: query ?? this.query);
  }
}
