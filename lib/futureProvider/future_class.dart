import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/futureProvider/future_provider.dart';

class FutureClass extends ConsumerWidget {
  const FutureClass({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: provider.when(
          skipLoadingOnRefresh: false,
          // Reload krny pr loader chly ga
          data: (value) => ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              return Text(value[index].toString());
            },
          ),
          error: (error, stack) => Text(error.toString()),
          loading: () => CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          ref.invalidate(futureProvider);
          
        },
      ),
    );
  }
}
