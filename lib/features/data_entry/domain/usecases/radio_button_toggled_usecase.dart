import 'package:csspt_app/core/usecase/usecase.dart';
import 'package:csspt_app/features/data_entry/data/models/data_entry_devotee_model.dart';
import 'package:csspt_app/features/data_entry/data/models/data_entry_state_data_model.dart';

class RadioButtonToggledUseCase extends UseCase {
  RadioButtonToggledUseCase();

  @override
  Future call({params}) async {
    String key = params["key"];
    String value = params["value"];
    DataEntryStateDataModel stateData = params["state_data"];

    if (key == "in_group") {
      DataEntryDevoteeModel data = stateData.data!.copyWith(inGroup: value);
      stateData = stateData.copyWith(data: data);
    } else if (key == "join_group") {
      DataEntryDevoteeModel data = stateData.data!.copyWith(joinGroup: value);
      stateData = stateData.copyWith(data: data);
    } else if (key == "pictures_for_social_media") {
      DataEntryDevoteeModel data =
          stateData.data!.copyWith(picturesForSocialMedia: value);
      stateData = stateData.copyWith(data: data);
    } else if (key == "volunteering") {
      DataEntryDevoteeModel data =
          stateData.data!.copyWith(volunteering: value);
      stateData = stateData.copyWith(data: data);
    }

    return stateData;
  }
}
