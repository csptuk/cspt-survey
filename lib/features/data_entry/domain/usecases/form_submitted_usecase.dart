import 'package:csspt_app/core/usecase/usecase.dart';
import 'package:csspt_app/features/data_entry/data/models/data_entry_state_data_model.dart';
import 'package:csspt_app/features/data_entry/domain/repositories/data_entry_repository.dart';

class FormSubmittedUseCase extends UseCase {
  FormSubmittedUseCase(this._dataEntryRepository);

  final DataEntryRepository _dataEntryRepository;

  @override
  Future call({params}) async {
    DataEntryStateDataModel stateData = params["state_data"];

    await _dataEntryRepository.addDataToLocalRepository(data: stateData.data!);

    stateData = stateData.copyWith(validationFailed: false, submitted: true);

    return stateData;
  }
}
