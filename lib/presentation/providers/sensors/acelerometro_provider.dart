import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';

class AccelerometerXYZ {
  final double x;
  final double y;
  final double z;

  AccelerometerXYZ({required this.x, required this.y, required this.z});
  @override
  String toString() {
    // TODO: implement toString
    return 'X$x Y $y Z$z ';
  }
}
final accelerometerGavritiProvider = StreamProvider.autoDispose<AccelerometerXYZ>((ref) async* {
  await for (final event in accelerometerEvents) {
    final x = double.parse(event.x.toStringAsFixed(2));
    final y = double.parse(event.x.toStringAsFixed(2));
    final z = double.parse(event.x.toStringAsFixed(2));
    yield AccelerometerXYZ(x: x, y: y, z: z);
  }
  // gyroscopeEvents.listen((event) {
  //   // event.
  //  });
});

final accelerometerProvider = StreamProvider.autoDispose<AccelerometerXYZ>((ref) async* {
  await for (final event in accelerometerEvents) {
    final x = double.parse(event.x.toStringAsFixed(2));
    final y = double.parse(event.x.toStringAsFixed(2));
    final z = double.parse(event.x.toStringAsFixed(2));
    yield AccelerometerXYZ(x: x, y: y, z: z);
  }
  // gyroscopeEvents.listen((event) {
  //   // event.
  //  });
});

// Me quede en mostrar datos del giroscpio 