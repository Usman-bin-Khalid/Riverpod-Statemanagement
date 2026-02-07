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
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      body: Center(
        child: postList.when(data: (value) => ListView.builder(itemBuilder: itemBuilder), error: (error, stack) => Text(error.toString()), loading: () =>  const CircularProgressIndicator()),
      ),
    );
  }
}
