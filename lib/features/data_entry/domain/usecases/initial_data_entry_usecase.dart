import 'package:csspt_app/core/usecase/usecase.dart';
import 'package:csspt_app/features/data_entry/data/models/data_entry_devotee_model.dart';
import 'package:csspt_app/features/data_entry/data/models/data_entry_state_data_model.dart';
import 'package:csspt_app/features/data_entry/data/models/validators_model.dart';

class InitialDataEntryUseCase extends UseCase {
  InitialDataEntryUseCase();

  @override
  Future call({params}) async {
    // Don't make it const
    bool dup = false;
    DataEntryStateDataModel stateData = DataEntryStateDataModel(
      data: DataEntryDevoteeModel(
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
            "value": dup,
          },
          {
            "title": "Prasad Prep / Serving / Inventory maintenance",
            "value": dup,
          },
          {
            "title": "Fund Raising",
            "value": dup,
          },
          {
            "title": "Front Desk",
            "value": dup,
          },
          {
            "title": "Social Media Assistance",
            "value": dup,
          },
        ],
      ).toJson(),
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
      submitted: false,
    );

    return stateData;
  }
}
