import 'package:csspt_app/core/usecase/usecase.dart';
import 'package:csspt_app/features/data_visualize/data/models/data_visualize_column_model.dart';
import 'package:csspt_app/features/data_visualize/data/models/data_visualize_state_data_model.dart';
import 'package:csspt_app/features/data_visualize/domain/repositories/data_visualize_repository.dart';

class InitialDataVisualizeUseCase extends UseCase {
  InitialDataVisualizeUseCase(this._dataVisualizeRepository);

  final DataVisualizeRepository _dataVisualizeRepository;

  @override
  Future call({params}) async {
    DataVisualizeStateDataModel stateData = DataVisualizeStateDataModel(
      columns: const [
        DataVisualizeColumnModel(title: "Actions", value: ""),
        DataVisualizeColumnModel(title: "Date", value: "date"),
        DataVisualizeColumnModel(title: "First Name", value: "first_name"),
        DataVisualizeColumnModel(title: "Last Name", value: "last_name"),
        DataVisualizeColumnModel(title: "Email", value: "email"),
        DataVisualizeColumnModel(
            title: "Mobile Number", value: "mobile_number"),
        DataVisualizeColumnModel(title: "Already In Group", value: "in_group"),
        DataVisualizeColumnModel(title: "Join Group", value: "join_group"),
        DataVisualizeColumnModel(
            title: "Pics for Soc Med",
            value: "pictures_for_social_media"),
        DataVisualizeColumnModel(title: "Volunteering", value: "volunteering"),
        DataVisualizeColumnModel(
            title: "Prep & Org Event",
            value: "0"),
        DataVisualizeColumnModel(
            title: "Prasad Prep / Serve / Inv main",
            value: "1"),
        DataVisualizeColumnModel(
            title: "Fund Raising", value: "2"),
        DataVisualizeColumnModel(
            title: "Front Desk", value: "3"),
        DataVisualizeColumnModel(
            title: "Soc Media", value: "4"),
      ],
      data: await _dataVisualizeRepository.fetchLocalDataBaseData(),
    );

    return stateData;
  }
}
