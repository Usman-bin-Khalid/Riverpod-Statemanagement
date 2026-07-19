import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider<int>((ref) async {
  await Future.delayed(const Duration(seconds: 2));
  return 3;
});

