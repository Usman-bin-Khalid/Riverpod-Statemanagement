import 'package:riverpod/legacy.dart';

// Agr hum ny riverpod mai outside mai kuch pass krna hy to hum FamilyProvider
// ko use krty hyn or is case mai isko hum int pass kr rhy hyn (second mai)
// but is ki gha hum kuch bhi pass krskty hyn like list, map, double etc
final multipleProvider = StateProvider.family<int, Map<String, dynamic>>((
  ref,
  number,
) {
  return number['id'] * 6;
});
