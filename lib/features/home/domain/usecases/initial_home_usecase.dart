import 'package:csspt_app/core/usecase/usecase.dart';
import 'package:csspt_app/features/home/data/models/home_devotee_model.dart';
import 'package:csspt_app/features/home/data/models/state_data_model.dart';
import 'package:csspt_app/features/home/data/models/validators_model.dart';

class InitialHomeUseCase extends UseCase {
  InitialHomeUseCase();

  @override
  Future call({params}) async {
    // Don't make it const
    StateDataModel stateData = StateDataModel(
      data: HomeDevoteeModel(
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
      validators: ValidatorsModel(
        firstNameValidator: (String? value) {
          if ((value ?? "").trim().isEmpty) {
            return "Firstname is required";
          } else {
            return null;
          }
        },
        lastNameValidator: (String? value) {
          if ((value ?? "").trim().isEmpty) {
            return "LastName is required";
          } else {
            return null;
          }
        },
        emailValidator: (String? value) {
          final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

          if ((value ?? "").trim().isEmpty) {
            return "Email is required";
          } else if (!emailRegex.hasMatch(value ?? "")) {
            return "Email is Invalid";
          } else {
            return null;
          }
        },
        mobileNumberValidator: (String? value) {
          final RegExp mobileNumberRegex = RegExp(
              r'^[\+]?\(?([0-9]{3})\)?[-.\s]?([0-9]{3})[-.\s]?([0-9]{4,6})$');

          if ((value ?? "").trim().isEmpty) {
            return "Mobile No is required";
          } else if (!mobileNumberRegex.hasMatch(value ?? "")) {
            return "Mobile No is Invalid";
          } else {
            return null;
          }
        },
      ),
      validationFailed: false,
    );

    return stateData;
  }
}
