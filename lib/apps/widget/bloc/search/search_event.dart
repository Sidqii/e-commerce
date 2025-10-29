abstract class SearchEvent {}

class SearchTextField extends SearchEvent {
  final String query;

  SearchTextField(this.query);
}
