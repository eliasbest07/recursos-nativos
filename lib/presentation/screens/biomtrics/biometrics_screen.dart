import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_recursos_nativos/presentation/providers/local_auth/local_auth_provider.dart';

class BiometricsScreen extends ConsumerWidget {
  const BiometricsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canCheckBiometrics = ref.watch(canCheckBiometrycsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Biometric Screen'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(onPressed: () {}, child: Text('Autenticar')),
          const SizedBox(
            height: 20,
          ),
          canCheckBiometrics.when(
            data: (data) => Text('puede revisar biometricos $data'),
            error: (error, _) => Text('Error: $error'),
            loading: () =>  const SizedBox(width: 1),),
          Text(
            'Estado del biometrico',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'Estado del biometrico',
            style: TextStyle(fontSize: 30),
          )
        ],
      )),
    );
  }
}
