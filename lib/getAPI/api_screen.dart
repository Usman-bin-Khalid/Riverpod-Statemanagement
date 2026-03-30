import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/getAPI/post_provider.dart';

class ApiScreen extends ConsumerWidget {
  const ApiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postList = ref.watch(postProvider);
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          ref.invalidate(postProvider);
        
        },
      ),
      body: Center(
        child: postList.when(
          data: (data) => ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return Card(
                child: Column(
                  children: [
                    Text(item.id.toString()),
                    Text(item.title),
                    Text(item.body),
                    Text(item.userId.toString()),
                  ],
                ),
              );
            },
          ),
          error: (error, stack) => Text(error.toString()),
          loading: () => const CircularProgressIndicator(),
          skipLoadingOnRefresh: true,
        ),
      ),
    );
  }
}
