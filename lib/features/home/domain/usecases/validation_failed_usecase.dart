import 'package:csspt_app/core/usecase/usecase.dart';
import 'package:csspt_app/features/home/data/models/state_data_model.dart';

class ValidationFailedUseCase extends UseCase {
  ValidationFailedUseCase();

  @override
  Future call({params}) async {
    StateDataModel stateData = params["state_data"];

    stateData = stateData.copyWith(validationFailed: true);

    return stateData;
  }
}
