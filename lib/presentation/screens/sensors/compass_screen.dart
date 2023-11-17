import 'dart:math' show pi;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_recursos_nativos/presentation/providers/permitions/permission_handle_provider.dart';
import 'package:riverpod_recursos_nativos/presentation/providers/sensors/compass_provider.dart';

class CompassScreen extends ConsumerWidget {
  const CompassScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLocation = ref.watch(permissionsProvider).locationGrante;

    if (!isLocation) {
      return const AskPermission();
    }
    final compassHeading = ref.watch(compassProvider);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        title: const Text('Brujual'),
      ),
      body: compassHeading.when(
          data: (data) {
            data.toString();
            return Compass(heading: data ?? 0);
          },
          error: (error, stackTrace) {
            return Text(error.toString());
          },
          loading: () => const CircularProgressIndicator()),
      // body: Column(children: [
      //   Text(
      //     'Brujual',
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   Compass()
      // ]),
    );
  }
}

class Compass extends StatefulWidget {
  const Compass({super.key, required this.heading});
  final double heading;

  @override
  State<Compass> createState() => _CompassState();
}

class _CompassState extends State<Compass> {
   double prevValue = 0.0;
  double turns = 0;

  double getTurns() {

    double? direction = widget.heading;
    direction = (direction < 0) ? (360 + direction): direction;

    double diff = direction - prevValue;
    if(diff.abs() > 180) {

      if(prevValue > direction) {
        diff = 360 - (direction-prevValue).abs();
      } else {
        diff = 360 - (prevValue-direction).abs();
        diff = diff * -1;
      }
    }

    turns += (diff / 360);
    prevValue = direction;

    return turns * -1;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Norte'),
        const SizedBox(height: 20),
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/compass/quadrant-1.png'),
            Transform.rotate(
              angle: ( widget.heading * ( pi / 180 ) * -1),
              child: Image.asset('assets/compass/needle-1.png')),
              AnimatedRotation(
                turns: getTurns(),
                curve: Curves.easeInOut, 
                duration: const Duration(microseconds: 1000))
          ],
        )
      ],
    );
  }
}

class AskPermission extends ConsumerWidget {
  const AskPermission({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permiso requerido'),
      ),
      body: Center(
          child: FilledButton(
        child: Text(
          ' Localizacion Necesaria',
        ),
        onPressed: () {
          ref.read(permissionsProvider.notifier).requestLocationAcces();
        },
      )),
    );
  }
}
