import 'package:csspt_app/core/usecase/usecase.dart';
import 'package:csspt_app/features/home/data/models/devotee_model.dart';
import 'package:csspt_app/features/home/data/models/state_data_model.dart';

class InitialHomeUseCase extends UseCase {
  InitialHomeUseCase();

  @override
  Future call({params}) async {
    StateDataModel stateData = StateDataModel(
      data: DevoteeModel(
        firstName: "",
        lastName: "",
        email: "",
        mobileNumber: "",
        inGroup: "",
        joinGroup: "",
        picturesForSocialMedia: "",
        volunteering: "",
        volunteeringService: [
          {
            "title": "Prepare and Organising Events",
            "value": false,
          },
          {
            "title": "Prasad Prep/Serving/Inventory maintenance",
            "value": false,
          },
          {
            "title": "Fund Raising",
            "value": false,
          },
          {
            "title": "Front Desk",
            "value": false,
          },
          {
            "title": "Social Media Assistance",
            "value": false,
          },
        ],
      ),
      errorFields: [],
    );

    return stateData;
  }
}
