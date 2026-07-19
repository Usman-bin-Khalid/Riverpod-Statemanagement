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
        child: provider.when(data: (value) => Text(value.toString()), error: (error, stack) => Text(error.toString()), loading: () =>  CircularProgressIndicator()),
      ),
    );
  }
}