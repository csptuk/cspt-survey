import 'package:csspt_app/core/usecase/usecase.dart';
import 'package:csspt_app/features/data_visualize/data/models/data_visualize_state_data_model.dart';
import 'package:csspt_app/features/data_visualize/domain/repositories/data_visualize_repository.dart';

class DeleteDataVisualizeUseCase extends UseCase {
  DeleteDataVisualizeUseCase(this._dataVisualizeRepository);

  final DataVisualizeRepository _dataVisualizeRepository;

  @override
  Future call({params}) async {
    int key = params["key"];
    DataVisualizeStateDataModel stateData = params["state_data"];

    _dataVisualizeRepository.deleteData(key: key);

    stateData = stateData.copyWith(
        data: await _dataVisualizeRepository.fetchLocalDataBaseData());

    return stateData;
  }
}
