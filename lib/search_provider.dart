import 'package:flutter_riverpod/legacy.dart';

final searchProvider = StateNotifierProvider<SearchNotifier, SearchState>((
  ref,
) {
  // StateNotifierProvider Complex States ko handle krny ky liy use hota hy
  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(SearchState(search: '', isChanged: false));
  void search(String query) {
    state = state.copyWith(search: query);
  }

  void onChanged(bool isChange) {
    state = state.copyWith(isChanged: isChange);
  }
}

class SearchState {
  final String search;
  final bool isChanged;
  SearchState({required this.search, required this.isChanged});
  SearchState copyWith({String? search, bool? isChanged}) {
    return SearchState(
      search: search ?? this.search,
      isChanged: isChanged ?? this.isChanged,
    );
  }
}
