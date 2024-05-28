import 'package:csspt_app/features/data_entry/data/repositories/data_entry_repository_implementation.dart';
import 'package:csspt_app/features/data_entry/domain/repositories/data_entry_repository.dart';
import 'package:csspt_app/features/data_entry/domain/usecases/checkbox_selected_usecase.dart';
import 'package:csspt_app/features/data_entry/domain/usecases/form_submitted_usecase.dart';
import 'package:csspt_app/features/data_entry/domain/usecases/initial_data_entry_usecase.dart';
import 'package:csspt_app/features/data_entry/domain/usecases/radio_button_toggled_usecase.dart';
import 'package:csspt_app/features/data_entry/domain/usecases/text_field_focus_change_usecase.dart';
import 'package:csspt_app/features/data_entry/domain/usecases/validation_failed_usecase.dart';
import 'package:csspt_app/features/data_entry/presentation/bloc/data_entry_bloc.dart';
import 'package:csspt_app/features/data_visualize/data/repositories/data_visualize_repository_implementation.dart';
import 'package:csspt_app/features/data_visualize/domain/repositories/data_visualize_repository.dart';
import 'package:csspt_app/features/data_visualize/domain/usecases/delete_data_visualize_usecase.dart';
import 'package:csspt_app/features/data_visualize/domain/usecases/edit_data_visualize_usecase.dart';
import 'package:csspt_app/features/data_visualize/domain/usecases/initial_data_visualize_usecase.dart';
import 'package:csspt_app/features/data_visualize/domain/usecases/save_data_visualize_usecase.dart';
import 'package:csspt_app/features/data_visualize/presentation/bloc/data_visualize_bloc.dart';
import 'package:csspt_app/local_hive.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Hive
  sl.registerLazySingleton<LocalHive>(() => LocalHive());

  // Data Entry
  sl.registerLazySingleton<DataEntryRepository>(
      () => DataEntryRepositoryImplementation());
  sl.registerLazySingleton<InitialDataEntryUseCase>(
      () => InitialDataEntryUseCase());
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

  // Data Visualize
  sl.registerLazySingleton<DataVisualizeRepository>(
      () => DataVisualizeRepositoryImplementation());
  sl.registerLazySingleton<InitialDataVisualizeUseCase>(
      () => InitialDataVisualizeUseCase(sl()));
  sl.registerLazySingleton<EditDataVisualizeUseCase>(
      () => EditDataVisualizeUseCase());
  sl.registerLazySingleton<SaveDataVisualizeUseCase>(
      () => SaveDataVisualizeUseCase(sl()));
  sl.registerLazySingleton<DeleteDataVisualizeUseCase>(
      () => DeleteDataVisualizeUseCase(sl()));
  sl.registerFactory<DataVisualizeBloc>(
      () => DataVisualizeBloc(sl(), sl(), sl(), sl()));
}
