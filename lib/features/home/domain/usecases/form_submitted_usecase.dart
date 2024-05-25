import 'package:csspt_app/core/usecase/usecase.dart';
import 'package:csspt_app/features/home/data/models/state_data_model.dart';
import 'package:csspt_app/features/home/domain/repositories/home_repository.dart';

class FormSubmittedUseCase extends UseCase {
  FormSubmittedUseCase(this._homeRepository);

  final HomeRepository _homeRepository;

  @override
  Future call({params}) async {
    StateDataModel stateData = params["state_data"];

    stateData = stateData.copyWith(validationFailed: false);

    _homeRepository.addDataToLocalRepository(data: stateData.data!);

    return stateData;
  }
}
