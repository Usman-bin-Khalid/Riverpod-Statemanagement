import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/familyProvider/family_provider.dart';

class FamilyProviderScreen extends ConsumerWidget {
  const FamilyProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, dynamic> map = {'id': 20};
    final result = ref.watch(multipleProvider(map));

    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(result.toString())),
    );
  }
}
