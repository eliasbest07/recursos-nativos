import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_recursos_nativos/config/config.dart';
import 'package:riverpod_recursos_nativos/presentation/providers/_app_state_provider.dart';
import 'package:riverpod_recursos_nativos/presentation/providers/permitions/permission_handle_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

// WidgetsBindingObserver Observar el estado de la aplicacion
class MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    ref.read(permissionsProvider.notifier).checkPermissions();
  }

  // cuando se hacer un Observer o un Stream hay que limpiarlo, quitarlo de memoria
  // esto se hacer cuando se destrulle el widget osea dispose
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    ref.read(appStateProvider.notifier).state = state;
    // print('State: $state');
    if (state == AppLifecycleState.resumed) {
      ref.read(permissionsProvider.notifier).checkPermissions();
    }

    /*
      Resumed
      inactive
      paused Se mando al background
      detached fue destruida 

    */
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      title: 'Recursos Nativo Flutter',
      theme: AppTheme().getTheme(),
    );
  }
}
