import 'package:csspt_app/core/usecase/usecase.dart';
import 'package:csspt_app/features/home/data/models/home_devotee_model.dart';
import 'package:csspt_app/features/home/data/models/state_data_model.dart';

class RadioButtonToggledUseCase extends UseCase {
  RadioButtonToggledUseCase();

  @override
  Future call({params}) async {
    String key = params["key"];
    String value = params["value"];
    StateDataModel stateData = params["state_data"];

    if (key == "in_group") {
      HomeDevoteeModel data = stateData.data!.copyWith(inGroup: value);
      stateData = stateData.copyWith(data: data);
    } else if (key == "join_group") {
      HomeDevoteeModel data = stateData.data!.copyWith(joinGroup: value);
      stateData = stateData.copyWith(data: data);
    } else if (key == "pictures_for_social_media") {
      HomeDevoteeModel data =
          stateData.data!.copyWith(picturesForSocialMedia: value);
      stateData = stateData.copyWith(data: data);
    } else if (key == "volunteering") {
      HomeDevoteeModel data = stateData.data!.copyWith(volunteering: value);
      stateData = stateData.copyWith(data: data);
    }

    return stateData;
  }
}
