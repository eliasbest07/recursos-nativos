import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_recursos_nativos/presentation/widgets/main_menu.dart';

class PermisoScreen extends StatelessWidget {
  const PermisoScreen({super.key});
// mandar SMS Contacto, GPS, Camara, Microfono ...
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal:30.0),
        child:  CustomScrollView(slivers: [
          SliverAppBar(title: const Text('Miselanios'),
          actions: [
          IconButton(
              onPressed: () {
                context.push('/permissions');
              },
              icon: const Icon(Icons.settings))
        ],),
          ManiMenu(),
        ],),
      )
    );
  }
}
