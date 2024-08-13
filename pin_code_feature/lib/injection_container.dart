import 'package:get_it/get_it.dart';
import 'package:camera/camera.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingletonAsync<CameraDescription>(() async {
    final cameras = await availableCameras();
    return cameras.first;
  });
}
