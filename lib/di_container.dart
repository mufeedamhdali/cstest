import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'provider/image_provider.dart';
import 'service/image_service.dart';


final sl = GetIt.instance;

Future<void> init() async {

  // Repository
  sl.registerLazySingleton(() => ImageService(sharedPreferences: sl()));

  // Provider
  sl.registerFactory(() => AppImageProvider(imageService: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
