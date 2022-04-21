import 'package:get_it/get_it.dart';
import 'package:hiringtest/services/mock-service.dart';
import 'package:hiringtest/utils/utils.dart';

import 'navigation-utils.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => MockService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => Utils());
}
