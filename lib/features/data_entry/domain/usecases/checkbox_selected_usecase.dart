import 'package:csspt_app/core/usecase/usecase.dart';
import 'package:csspt_app/features/data_entry/data/models/data_entry_state_data_model.dart';

class CheckboxSelectedUseCase extends UseCase {
  CheckboxSelectedUseCase();

  @override
  Future call({params}) async {
    String key = params["key"];
    bool value = params["value"];
    DataEntryStateDataModel stateData = params["state_data"];

    List<Map<String, dynamic>> services =
        stateData.data!["volunteering_service"]!;
    services.firstWhere((e) => e["title"] == key)["value"] =
        value == true ? "Yes" : "";

    stateData.data!["volunteering_service"] = services;

    return stateData;
  }
}
