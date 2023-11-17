import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_recursos_nativos/presentation/providers/sensors/gyroscope_provider.dart';

class GyroscopeBallScreen extends ConsumerWidget {
  const GyroscopeBallScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gyroscope$ = ref.watch(gyroscopeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giroscopio ball'),
      ),
      body: SizedBox.expand(
        child: gyroscope$.when(
          data: (data) {
            return MovingBall(x: data.x, y: data.y);
          },
          error: (error, stackTrace) => Center(
            child: Text('$error'),
          ),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class MovingBall extends StatelessWidget {
  const MovingBall({super.key, required this.x, required this.y});
  final double x;
  final double y;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      left: ((y*100)-25)+ (size.width/2),
      top: (x*100)-25+ (size.height/2),
      child: Container(
        height: 50,
        width: 50,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
        child: Column(children: [
          Text('$x', style: const TextStyle(color: Colors.white)),
          Text('$y', style: const TextStyle(color: Colors.white))
        ]),
      ),
    );
  }
}
