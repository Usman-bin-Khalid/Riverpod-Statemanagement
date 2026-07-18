import 'package:riverpod/legacy.dart';
import 'package:riverpod_state_management/provider/favourite_state.dart';

final favouriteProvider = StateNotifierProvider<FavouriteNotifier, FavouriteState>((ref) {
  return FavouriteNotifier();
}); 



class FavouriteNotifier extends StateNotifier<FavouriteState> {
  FavouriteNotifier () : super(FavouriteState(allItems: [], filteredItem: [], search: ''));
}