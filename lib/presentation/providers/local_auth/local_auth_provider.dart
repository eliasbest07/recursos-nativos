import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_recursos_nativos/config/plugins/local_auth_plugin.dart';

final canCheckBiometrycsProvider = FutureProvider<bool>((ref) async {
  return await LocalAuthPlugin.canCheckBiometrics();
});
final localAuthProvider = StateNotifierProvider<LocalAuthNotifier, LocalAuthState>((ref) => LocalAuthNotifier());

enum LocalAuthStatus {
  authenticated, 
  notAuthenticated,
  authentucating
}

class LocalAuthState {

  final bool didAtuthenticate;
  final LocalAuthStatus status;
  final String message;

  LocalAuthState({ this.didAtuthenticate = false, this.status = LocalAuthStatus.notAuthenticated,  this.message = ''});

@override
  String toString() {
    return '$didAtuthenticate';
  }

}

class LocalAuthNotifier extends StateNotifier<LocalAuthState>{
  LocalAuthNotifier(): super(LocalAuthState());

  Future <(bool, String)> authenticateUser()async{
    final ( didAuthenticate, messange ) = await LocalAuthPlugin.authenticate();
    LocalAuthState newState = LocalAuthState(
      didAtuthenticate: didAuthenticate,
      message: messange,
      status: didAuthenticate ? LocalAuthStatus.authenticated : LocalAuthStatus.notAuthenticated
    );
    state=newState;
    return (didAuthenticate, messange);
  }

}