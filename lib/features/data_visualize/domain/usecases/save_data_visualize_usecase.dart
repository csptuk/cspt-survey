import 'package:csspt_app/core/usecase/usecase.dart';
import 'package:csspt_app/features/data_visualize/data/models/data_visualize_state_data_model.dart';
import 'package:csspt_app/features/data_visualize/domain/repositories/data_visualize_repository.dart';

class SaveDataVisualizeUseCase extends UseCase {
  SaveDataVisualizeUseCase(this._dataVisualizeRepository);

  final DataVisualizeRepository _dataVisualizeRepository;

  @override
  Future call({params}) async {
    int key = params["key"];
    List<String> texts = params["texts"];
    DataVisualizeStateDataModel stateData = params["state_data"];

    List<Map<String, dynamic>> data =
        await _dataVisualizeRepository.modifyLocalDatabaseData(
            key: key,
            texts: texts,
            row: stateData.data!.firstWhere((e) => e["key"] == key));

    stateData = stateData.copyWith(data: data);

    return stateData;
  }
}
