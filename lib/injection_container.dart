import 'package:csspt_app/features/data_entry/data/repositories/data_entry_repository_implementation.dart';
import 'package:csspt_app/features/data_entry/domain/repositories/data_entry_repository.dart';
import 'package:csspt_app/features/data_entry/domain/usecases/checkbox_selected_usecase.dart';
import 'package:csspt_app/features/data_entry/domain/usecases/form_submitted_usecase.dart';
import 'package:csspt_app/features/data_entry/domain/usecases/initial_data_entry_usecase.dart';
import 'package:csspt_app/features/data_entry/domain/usecases/radio_button_toggled_usecase.dart';
import 'package:csspt_app/features/data_entry/domain/usecases/text_field_focus_change_usecase.dart';
import 'package:csspt_app/features/data_entry/domain/usecases/validation_failed_usecase.dart';
import 'package:csspt_app/features/data_entry/presentation/bloc/data_entry_bloc.dart';
import 'package:csspt_app/local_hive.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Hive
  sl.registerLazySingleton<LocalHive>(() => LocalHive());

  // DataEntry
  sl.registerLazySingleton<DataEntryRepository>(
      () => DataEntryRepositoryImplementation());
  sl.registerLazySingleton<InitialDataEntryUseCase>(() => InitialDataEntryUseCase());
  sl.registerLazySingleton<TextFieldFocusChangeUseCase>(
      () => TextFieldFocusChangeUseCase());
  sl.registerLazySingleton<RadioButtonToggledUseCase>(
      () => RadioButtonToggledUseCase());
  sl.registerLazySingleton<CheckboxSelectedUseCase>(
      () => CheckboxSelectedUseCase());
  sl.registerLazySingleton<ValidationFailedUseCase>(
      () => ValidationFailedUseCase());
  sl.registerLazySingleton<FormSubmittedUseCase>(
      () => FormSubmittedUseCase(sl()));
  sl.registerFactory<DataEntryBloc>(
      () => DataEntryBloc(sl(), sl(), sl(), sl(), sl(), sl()));
}
