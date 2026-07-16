import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/search_provider.dart';



class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(searchProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (value) {
              ref.read(searchProvider.notifier).search(value);
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final search = ref.watch(searchProvider);
              return Text(search.search);
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final isChange = ref.watch((searchProvider).select((state) => state.isChanged));
              return Switch(
                value: isChange,
                onChanged: (value) {
                  ref.read(searchProvider.notifier).onChanged(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
