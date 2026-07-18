import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/provider/favourite_provider.dart';

class FavouriteScreen extends ConsumerWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteList = ref.watch(favouriteProvider);
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(favouriteProvider.notifier).addItem();
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: 'Search',
            border: OutlineInputBorder(),
            ),
                onChanged: (value) {

                },         
          ),
          Expanded(
            child: ListView.builder(
              itemCount: favouriteList.filteredItem.length,
              itemBuilder: (context, index) {
                final item = favouriteList.filteredItem[index];
                return ListTile(
                  title: Text(item.name),
                  trailing: Icon(item.favourite ? Icons.favorite : Icons.favorite_border),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
