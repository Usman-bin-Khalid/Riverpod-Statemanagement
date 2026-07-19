import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/streamProvider/stream_provider.dart';

class StreamScreen extends ConsumerWidget {
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.invalidate(stockPriceProvider);
        },
        child: Icon(Icons.refresh),
      ),
      appBar: AppBar(title: const Text('Stream Provider')),
      body: Consumer(
        builder: (context, ref, child) {
          final provider = ref.watch(stockPriceProvider);
          return Center(
            child: provider.when(
              skipLoadingOnRefresh: false,
              data: (price) => Text(price.toStringAsFixed(2).toString()),
              error: (error, stack) => Text(error.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
