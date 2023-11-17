import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';

class MagnetrometerXYZ {
  final double x;
  final double y;
  final double z;

  MagnetrometerXYZ({required this.x, required this.y, required this.z});
  @override
  String toString() {
    // TODO: implement toString
    return 'X$x Y $y Z$z ';
  }
}

final magnetrometerProvider = StreamProvider.autoDispose<MagnetrometerXYZ>((ref) async* {
  await for (final event in magnetometerEvents) {
    final x = double.parse(event.x.toStringAsFixed(2));
    final y = double.parse(event.x.toStringAsFixed(2));
    final z = double.parse(event.x.toStringAsFixed(2));
    yield MagnetrometerXYZ(x: x, y: y, z: z);
  }
  // gyroscopeEvents.listen((event) {
  //   // event.
  //  });
});

