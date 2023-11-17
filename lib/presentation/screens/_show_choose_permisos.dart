import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_recursos_nativos/presentation/providers/permitions/permission_handle_provider.dart';
// import 'package:riverpod_recursos_nativos/presentation/providers/providers.dart';

class ShowChoosePremiso extends StatelessWidget {
  const ShowChoosePremiso({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permisos'),
      ),
      body: const _Permissions(),
    );
  }
}

class _Permissions extends ConsumerWidget {
  const _Permissions();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final AppLifecycleState state=  ref.watch(appStateProvider);
    final permissions = ref.watch(permissionsProvider);
    return ListView(
      children: [
        CheckboxListTile(
            value: permissions.camaraGrante,
            onChanged: (_) {
              ref.read(permissionsProvider.notifier).requestCamaraAcces();
            },
            title: const Text('Camara'),
            subtitle: Text('${permissions.camara}')),
         CheckboxListTile(
            value: permissions.photoLibraryGrante,
            onChanged: (_) {
              ref.read(permissionsProvider.notifier).requestGaleryAcces();
            },
            title: const Text('Galeria de Fotos'),
            subtitle: Text('${permissions.photoLibrary}')),
        CheckboxListTile(
            value: permissions.locationGrante,
            onChanged: (_) {
              ref.read(permissionsProvider.notifier).requestLocationAcces();
            },
            title: const Text('Location'),
            subtitle: Text('${permissions.location}')),
          CheckboxListTile(
            value: permissions.locationGrante,
            onChanged: (_) {
              ref.read(permissionsProvider.notifier).requestSensorAcces();
            },
            title: const Text('Sensor'),
            subtitle: Text('${permissions.sensors}')),
        // ListTile(
        //   title: Text(state.name),
        // )
      ],
    );
  }
}
