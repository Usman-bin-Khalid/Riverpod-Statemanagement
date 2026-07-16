import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_state_management/slider_provider.dart';

final hello = Provider<String>((ref) {
  return "Subscribe";
});

final age = Provider<int>((ref) {
  return 20;
});

final counter = StateProvider<int>((ref) {
  return 0;
});

final switchProvider = StateProvider<bool>((ref) {
  return false;
});

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Consumer(
//               builder: (context, ref, child) {
//                 final count = ref.watch(counter);
//                 return Center(child: Text(count.toString()));
//               },
//             ),
//             Consumer(
//               builder: (context, ref, child) {
//                 final count = ref.watch(switchProvider);
//                 return Switch(
//                   value: count,
//                   onChanged: (value) {
//                     ref.read(switchProvider.notifier).state = value;
//                   },
//                 );
//               },
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   child: Text('+'),
//                   onPressed: () {
//                     ref.read(counter.notifier).state++;
//                   },
//                 ),
//                 ElevatedButton(
//                   child: Text('-'),
//                   onPressed: () {
//                     ref.read(counter.notifier).state--;
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );

//   }

// }

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
               Consumer(
              builder: (context, ref, child) {
                final slider = ref.watch(sliderProvider.select((state) => state.showPassword));

                return InkWell(
                  onTap: () {
                        final stateProvider = ref.read(sliderProvider.notifier);
                    stateProvider.state = stateProvider.state.copyWith(showPassword: !slider);
                  },
                  child: Container(
                    width: 200,
                    height: 200,
                  
                    child: slider ? Icon(Icons.password) : Icon(Icons.email),
                  ),
                );
              },
            ),
           
           
            Consumer(
              builder: (context, ref, child) {
                final slider = ref.watch(sliderProvider.select((state) => state.slider));

                return Container(
                  width: 200,
                  height: 200,

                  color: Colors.blue.withOpacity(slider),
                );
              },
            ),
           
           
           
            Consumer(
              builder: (context, ref, child) {
                  final slider = ref.watch(sliderProvider.select((state) => state.slider));
                return Slider(
                  value: slider,
                  onChanged: (value) {
                    final stateProvider = ref.read(sliderProvider.notifier);
                    stateProvider.state = stateProvider.state.copyWith(slider: value);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}



// class HomeScreen extends ConsumerStatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {

//   return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Consumer(
//               builder: (context, ref, child) {
//                 final count = ref.watch(counter);
//                 return Center(child: Text(count.toString()));
//               },
//             ),
//             Consumer(
//               builder: (context, ref, child) {
//                 final count = ref.watch(switchProvider);
//                 return Switch(
//                   value: count,
//                   onChanged: (value) {
//                     ref.read(switchProvider.notifier).state = value;
//                   },
//                 );
//               },
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   child: Text('+'),
//                   onPressed: () {
//                     ref.read(counter.notifier).state++;
//                   },
//                 ),
//                 ElevatedButton(
//                   child: Text('-'),
//                   onPressed: () {
//                     ref.read(counter.notifier).state--;
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
  
  
  
//   }
// }



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

