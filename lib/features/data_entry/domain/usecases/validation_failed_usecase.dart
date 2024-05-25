import 'package:csspt_app/core/usecase/usecase.dart';
import 'package:csspt_app/features/data_entry/data/models/data_entry_state_data_model.dart';

class ValidationFailedUseCase extends UseCase {
  ValidationFailedUseCase();

  @override
  Future call({params}) async {
    DataEntryStateDataModel stateData = params["state_data"];

    stateData = stateData.copyWith(validationFailed: true);

    return stateData;
  }
}
