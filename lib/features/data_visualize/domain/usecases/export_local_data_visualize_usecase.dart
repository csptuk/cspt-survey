import 'package:csspt_app/core/usecase/usecase.dart';
import 'package:csspt_app/features/data_visualize/domain/repositories/data_visualize_repository.dart';

class ExportLocalDataVisualizeUseCase extends UseCase {
  ExportLocalDataVisualizeUseCase(this._dataVisualizeRepository);

  final DataVisualizeRepository _dataVisualizeRepository;

  @override
  Future call({params}) async {
    String msg = await _dataVisualizeRepository.exportLocalData();

    return msg;
  }
}
