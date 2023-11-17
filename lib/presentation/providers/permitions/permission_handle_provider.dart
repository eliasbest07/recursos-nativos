import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

// State norifier Provider
final permissionsProvider =
    StateNotifierProvider<PermissionsNotifier, PermissionState>((ref) {
  return PermissionsNotifier();
});

// Class Notifier
class PermissionsNotifier extends StateNotifier<PermissionState> {
  PermissionsNotifier() : super(PermissionState()) {
   // checkPermissions();
  }

  Future<void> checkPermissions() async {
    final permissionsArrays = await Future.wait({
      Permission.camera.status,
      Permission.photos.status,
      Permission.sensors.status,
      Permission.location.status,
      Permission.locationAlways.status,
      Permission.locationWhenInUse.status,
    });

    state = state.copyWith(
        camara: permissionsArrays[0],
        photoLibrary: permissionsArrays[1],
        sensors: permissionsArrays[2],
        location: permissionsArrays[3],
        locationsAlways: permissionsArrays[4],
        locationWhenInUser: permissionsArrays[5]);
  }

  requestCamaraAcces() async {
    final status = await Permission.camera.request();
    state = state.copyWith(camara: status);
    if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings(); // mandar abrir las settings del usuarip
    }
  }
  
  requestGaleryAcces()async{
     final status = await Permission.photos.request();
    state = state.copyWith(photoLibrary: status);
    if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings(); // mandar abrir las settings del usuarip
    }
  }
  requestLocationAcces()async{
    final status = await Permission.location.request();
    state = state.copyWith(location: status);
    if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings(); // mandar abrir las settings del usuarip
    }
  }
  requestSensorAcces()async{
    final status = await Permission.sensors.request();
    state = state.copyWith(sensors: status);
    if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings(); // mandar abrir las settings del usuarip
    }
  }
}

class PermissionState {
  final PermissionStatus camara;
  final PermissionStatus photoLibrary;
  final PermissionStatus sensors;

  final PermissionStatus location;
  final PermissionStatus locationsAlways;
  final PermissionStatus locationWhenInUser;

  PermissionState({
    this.camara = PermissionStatus.denied,
    this.photoLibrary = PermissionStatus.denied,
    this.sensors = PermissionStatus.denied,
    this.location = PermissionStatus.denied,
    this.locationsAlways = PermissionStatus.denied,
    this.locationWhenInUser = PermissionStatus.denied,
  });

  PermissionState copyWith({
    PermissionStatus? camara,
    PermissionStatus? photoLibrary,
    PermissionStatus? sensors,
    PermissionStatus? location,
    PermissionStatus? locationsAlways,
    PermissionStatus? locationWhenInUser,
  }) {
    return PermissionState(
        camara: camara ?? this.camara,
        photoLibrary: photoLibrary ?? this.photoLibrary,
        sensors: sensors ?? this.sensors,
        location: location ?? this.location,
        locationsAlways: locationsAlways ?? this.locationsAlways,
        locationWhenInUser: locationWhenInUser ?? this.locationWhenInUser);
  }

  get camaraGrante {
    return camara == PermissionStatus.granted;
  }

  get photoLibraryGrante {
    return photoLibrary == PermissionStatus.granted;
  }

  get sensorsGrante {
    return sensors == PermissionStatus.granted;
  }

  get locationGrante {
    return location == PermissionStatus.granted;
  }

  get locationsAlwaysGrante {
    return locationsAlways == PermissionStatus.granted;
  }

  get locationWhenInUserGrante {
    return locationWhenInUser == PermissionStatus.granted;
  }
}
