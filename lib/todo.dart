import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/item_provider.dart';

class Todo extends ConsumerWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider);
    return Scaffold(
      appBar: AppBar(title: Text('To Do App')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem('New Item');
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile();
        },
      ),
    );
  }
}
