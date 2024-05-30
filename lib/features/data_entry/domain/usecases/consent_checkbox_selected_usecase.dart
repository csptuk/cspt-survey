import 'package:csspt_app/core/usecase/usecase.dart';
import 'package:csspt_app/features/data_entry/data/models/data_entry_state_data_model.dart';

class ConsentCheckboxSelectedUseCase extends UseCase {
  ConsentCheckboxSelectedUseCase();

  @override
  Future call({params}) async {
    bool value = params["value"];
    DataEntryStateDataModel stateData = params["state_data"];

    stateData = stateData.copyWith(consent: value);

    return stateData;
  }
}
