import 'package:riverpod/legacy.dart';
import 'package:riverpod_state_management/models/item.dart';

import 'package:riverpod_state_management/provider/favourite_state.dart';

final favouriteProvider =
    StateNotifierProvider<FavouriteNotifier, FavouriteState>((ref) {
      return FavouriteNotifier();
    });

class FavouriteNotifier extends StateNotifier<FavouriteState> {
  FavouriteNotifier()
    : super(FavouriteState(allItems: [], filteredItem: [], search: ''));

  void addItem() {
    List<Item> items = [
      Item(name: "Macbook", id: 1, favourite: true),
      Item(name: "Iphoe", id: 2, favourite: false),
      Item(name: "G-Force", id: 3, favourite: false),
      Item(name: "Samsung Ultra", id: 4, favourite: true),
      Item(name: "Google Pixel 9", id: 5, favourite: false),
      Item(name: "IPad Pro 13", id: 6, favourite: true),
    ];
    state = state.copyWith(
      allItems: items.toList(),
      filteredItem: items.toList(),
    );
  }

  void filterList(String search) {
    state = state.copyWith(
      filteredItem: _filterItems(state.allItems, search)
    );
  }

  List<Item> _filterItems(List<Item> items, String search) {
    if (search.isEmpty) {
      return items;
    }
    return items
        .where((item) => item.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }
}
