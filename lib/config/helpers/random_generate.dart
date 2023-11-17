import 'package:random_name_generator/random_name_generator.dart';

class RandomGenerator {
  static String getRandomName() {
    final randomName = RandomNames(Zone.spain);
    return randomName.fullName();
  }

  static Stream<String> randomNameStream() {
    return Stream.periodic(const Duration(seconds: 2), (i) {
      print('New Stream');
      return getRandomName();
    });
  }
}
