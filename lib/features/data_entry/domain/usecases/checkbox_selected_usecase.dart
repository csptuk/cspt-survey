import 'package:csspt_app/core/usecase/usecase.dart';
import 'package:csspt_app/features/data_entry/data/models/data_entry_devotee_model.dart';
import 'package:csspt_app/features/data_entry/data/models/data_entry_state_data_model.dart';

class CheckboxSelectedUseCase extends UseCase {
  CheckboxSelectedUseCase();

  @override
  Future call({params}) async {
    String key = params["key"];
    bool value = params["value"];
    DataEntryStateDataModel stateData = params["state_data"];

    List<Map<String, dynamic>> services = stateData.data!.volunteeringService!;
    services.firstWhere((e) => e["title"] == key)["value"] = value;

    DataEntryDevoteeModel data =
        stateData.data!.copyWith(volunteeringService: services);
    stateData = stateData.copyWith(data: data);

    return stateData;
  }
}
