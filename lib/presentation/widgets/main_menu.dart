import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final String router;

  MenuItem({required this.title, required this.icon, required this.router});
}

// esto es lo que tengo que hacer para repuests merida en categoria y en comienzo venta
final menuItems = <MenuItem>[
  MenuItem(
      title: 'Giroscopio',
      icon: Icons.browse_gallery_sharp,
      router: '/giroscopio'),
  MenuItem(
      title: 'Accelerometro',
      icon: Icons.browse_gallery_sharp,
      router: '/accelerometro'),
  MenuItem(
      title: 'Magnetrometo',
      icon: Icons.browse_gallery_sharp,
      router: '/magnetron'),
  MenuItem(
      title: 'Giroscopio Ball',
      icon: Icons.browse_gallery_sharp,
      router: '/giroscopio_ball'),
  MenuItem(
      title: 'Brujula',
      icon: Icons.browse_gallery_sharp,
      router: '/compass'),
        MenuItem(
      title: 'Pokemons',
      icon: Icons.browse_gallery_sharp,
      router: '/pokemons'),
];

class ManiMenu extends StatelessWidget {
  const ManiMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: menuItems
          .map((item) => HomeMenuItem(
                title: item.title,
                router: item.router,
                icon: item.icon,
              ))
          .toList(),
    );
  }
}

class HomeMenuItem extends StatelessWidget {
  const HomeMenuItem(
      {super.key,
      required this.title,
      required this.router,
      required this.icon,
      this.bgColors = const [Colors.lightBlue, Colors.blue]});
  final String title;
  final String router;
  final IconData icon;
  final List<Color> bgColors;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(router);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                colors: bgColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 40),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
