import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod App'),
      ),
      body: const _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView();

  @override
  Widget build(BuildContext context) {
    return ListView(children: const [
      _CustomListTile(
          title: 'State Provider',
          subTitle: 'un estado simpre',
          location: '/state-provider',
        ),
        
         _CustomListTile(
          title: 'Api pokemon',
          subTitle: 'muestra los nombres',
          location: '/pokemon',
        ),
  _CustomListTile(
          title: 'Stream Provider',
          subTitle: 'un estado simpre',
          location: '/stream',
        ),
  _CustomListTile(
          title: 'State Notifice Provider',
          subTitle: 'un estado personalizado por una clase',
          location: '/statenotifice',
        ),
        
    ]);
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.title,
    required this.subTitle,
    required this.location
  });
  final String title;
  final String subTitle;
  final String location;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () => context.push(location),
    );
  }
}
