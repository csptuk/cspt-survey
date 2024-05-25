import 'package:csspt_app/core/usecase/usecase.dart';
import 'package:csspt_app/features/data_entry/data/models/data_entry_devotee_model.dart';
import 'package:csspt_app/features/data_entry/data/models/data_entry_state_data_model.dart';

class TextFieldFocusChangeUseCase extends UseCase {
  TextFieldFocusChangeUseCase();

  @override
  Future call({params}) async {
    String key = params["key"];
    String value = params["value"];
    DataEntryStateDataModel stateData = params["state_data"];

    if (key == "first_name") {
      DataEntryDevoteeModel data = stateData.data!.copyWith(firstName: value);
      stateData = stateData.copyWith(data: data);
    } else if (key == "last_name") {
      DataEntryDevoteeModel data = stateData.data!.copyWith(lastName: value);
      stateData = stateData.copyWith(data: data);
    } else if (key == "email") {
      DataEntryDevoteeModel data = stateData.data!.copyWith(email: value);
      stateData = stateData.copyWith(data: data);
    } else if (key == "mobile_number") {
      DataEntryDevoteeModel data =
          stateData.data!.copyWith(mobileNumber: value);
      stateData = stateData.copyWith(data: data);
    }

    return stateData;
  }
}
