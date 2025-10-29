import 'package:e_commerce/apps/widget/bloc/search/search_event.dart';
import 'package:e_commerce/apps/widget/bloc/search/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<SearchTextField>((event, emit) {
      emit(state.copyWith(query: event.query));
    });
  }
}
