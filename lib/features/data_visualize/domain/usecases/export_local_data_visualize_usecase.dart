import 'package:csspt_app/core/usecase/usecase.dart';
import 'package:csspt_app/features/data_visualize/data/models/data_visualize_state_data_model.dart';
import 'package:csspt_app/features/data_visualize/domain/repositories/data_visualize_repository.dart';

class ExportLocalDataVisualizeUseCase extends UseCase {
  ExportLocalDataVisualizeUseCase(this._dataVisualizeRepository);

  final DataVisualizeRepository _dataVisualizeRepository;

  @override
  Future call({params}) async {
    DataVisualizeStateDataModel stateData = params["state_data"];

    _dataVisualizeRepository.exportLocalData();

    return stateData;
  }
}
