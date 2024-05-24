import 'package:csspt_app/core/usecase/usecase.dart';
import 'package:csspt_app/features/home/data/models/devotee_model.dart';
import 'package:csspt_app/features/home/data/models/state_data_model.dart';

class CheckboxSelectedUseCase extends UseCase {
  CheckboxSelectedUseCase();

  @override
  Future call({params}) async {
    String key = params["key"];
    bool value = params["value"];
    StateDataModel stateData = params["state_data"];

    List<Map<String, dynamic>> services = stateData.data!.volunteeringService!;
    services.firstWhere((e) => e["title"] == key)["value"] = value;

    DevoteeModel data = stateData.data!.copyWith(volunteeringService: services);
    stateData = stateData.copyWith(data: data);

    return stateData;
  }
}
