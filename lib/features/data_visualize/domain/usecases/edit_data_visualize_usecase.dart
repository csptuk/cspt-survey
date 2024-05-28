import 'package:csspt_app/core/usecase/usecase.dart';
import 'package:csspt_app/features/data_visualize/data/models/data_visualize_state_data_model.dart';

class EditDataVisualizeUseCase extends UseCase {
  EditDataVisualizeUseCase();

  @override
  Future call({params}) async {
    int key = params["key"];
    DataVisualizeStateDataModel stateData = params["state_data"];

    List<Map<String, dynamic>> data = stateData.data!;

    data.firstWhere((e) => e["key"] == key)["edit_state"] = true;

    stateData = stateData.copyWith(data: data);

    return stateData;
  }
}
