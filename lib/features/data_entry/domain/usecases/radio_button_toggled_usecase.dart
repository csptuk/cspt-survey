import 'package:csspt_app/core/usecase/usecase.dart';
import 'package:csspt_app/features/data_entry/data/models/data_entry_state_data_model.dart';

class RadioButtonToggledUseCase extends UseCase {
  RadioButtonToggledUseCase();

  @override
  Future call({params}) async {
    String key = params["key"];
    String value = params["value"];
    DataEntryStateDataModel stateData = params["state_data"];

    stateData.data![key] = value;

    return stateData;
  }
}
