import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_recursos_nativos/config/config.dart';

final nameStreamtestProvider = StreamProvider<List<String>>((ref) async* {
  yield [];

  await Future.delayed(const Duration(seconds: 2));
  yield ['Elias'];
});
//.autoDispose es para finalizar el estado de riverpod 
final nameStreamProvider = StreamProvider.autoDispose<String>((ref) async* {

  await for (final name in RandomGenerator.randomNameStream()) {
    yield name;
  }
  // RandomGenerator.randomNameStream().listen((name) {
  //   print(name);
  // });
});
