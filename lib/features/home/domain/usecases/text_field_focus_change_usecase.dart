import 'package:csspt_app/core/usecase/usecase.dart';
import 'package:csspt_app/features/home/data/models/devotee_model.dart';
import 'package:csspt_app/features/home/data/models/state_data_model.dart';

class TextFieldFocusChangeUseCase extends UseCase {
  TextFieldFocusChangeUseCase();

  @override
  Future call({params}) async {
    String key = params["key"];
    String value = params["value"];
    StateDataModel stateData = params["state_data"];

    if (key == "first_name") {
      DevoteeModel data = stateData.data!.copyWith(firstName: value);
      stateData = stateData.copyWith(data: data);
    } else if (key == "last_name") {
      DevoteeModel data = stateData.data!.copyWith(lastName: value);
      stateData = stateData.copyWith(data: data);
    } else if (key == "email") {
      DevoteeModel data = stateData.data!.copyWith(email: value);
      stateData = stateData.copyWith(data: data);
    } else if (key == "mobile_number") {
      DevoteeModel data = stateData.data!.copyWith(mobileNumber: value);
      stateData = stateData.copyWith(data: data);
    }

    return stateData;
  }
}
