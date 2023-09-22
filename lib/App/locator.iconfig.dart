
import '../ViewModels/main_view_model.dart';
import '../ViewModels/prefrences_view_model.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String? environment}) async{
  g.registerLazySingleton<PreferencesViewModel>(() => PreferencesViewModel());
  g.registerLazySingleton<MainViewModel>(() => MainViewModel());
 
}