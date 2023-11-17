import 'package:flutter/material.dart' show AppLifecycleState;
import 'package:flutter_riverpod/flutter_riverpod.dart';
 /*
      Resumed
      inactive
      paused Se mando al background
      detached fue destruida 

    */
final appStateProvider = StateProvider<AppLifecycleState>((ref) {
  return AppLifecycleState.resumed;
});
 // me quede en el video Permission Provider
