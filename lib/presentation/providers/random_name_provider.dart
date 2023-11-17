import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_recursos_nativos/config/config.dart';

final randomNameProvider = StateProvider.autoDispose<String>((ref) {

  return RandomGenerator.getRandomName();
});