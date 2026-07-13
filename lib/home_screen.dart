import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final hello = Provider<String>((ref) {
  return "Subscribe";
});
final age = Provider<int>((ref) {
  return 20;
});

final counter = StateProvider<int>((ref) {
  return 0;
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counter);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(count.toString()),
            Row(
              children: [
                ElevatedButton(
                  child: Text('+'),
                  onPressed: () {
                    ref.read(counter.notifier).state++;
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final subscribe = ref.watch(hello);
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home Screen')),
//       body: Center(child: Text(subscribe + age.toString())),
//     );
//   }
// }

