import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_state_management/item.dart';

final itemProvider = StateNotifierProvider<ItemNotifier, List<Item>>((ref) {
  return ItemNotifier();
});

class ItemNotifier extends StateNotifier<List<Item>> {
  ItemNotifier() : super([]);

  void addItem(String name) {
    final item = Item(id: DateTime.now().toString(), name: name);
    state.add(item);
    state = state.toList();
  }
}
