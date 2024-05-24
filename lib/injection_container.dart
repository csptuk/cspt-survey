import 'package:csspt_app/features/home/domain/usecases/checkbox_selected_usecase.dart';
import 'package:csspt_app/features/home/domain/usecases/initial_home_usecase.dart';
import 'package:csspt_app/features/home/domain/usecases/radio_button_toggled_usecase.dart';
import 'package:csspt_app/features/home/domain/usecases/text_field_focus_change_usecase.dart';
import 'package:csspt_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:csspt_app/local_hive.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Hive
  sl.registerLazySingleton<LocalHive>(() => LocalHive());

  // Home
  sl.registerLazySingleton<InitialHomeUseCase>(() => InitialHomeUseCase());
  sl.registerLazySingleton<TextFieldFocusChangeUseCase>(
      () => TextFieldFocusChangeUseCase());
  sl.registerLazySingleton<RadioButtonToggledUseCase>(
      () => RadioButtonToggledUseCase());
  sl.registerLazySingleton<CheckboxSelectedUseCase>(
      () => CheckboxSelectedUseCase());
  sl.registerFactory<HomeBloc>(() => HomeBloc(sl(), sl(), sl(), sl()));
}
