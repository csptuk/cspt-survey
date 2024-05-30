import 'package:csspt_app/core/usecase/usecase.dart';
import 'package:csspt_app/features/data_entry/data/models/data_entry_devotee_model.dart';
import 'package:csspt_app/features/data_entry/data/models/data_entry_state_data_model.dart';
import 'package:csspt_app/features/data_entry/data/models/validators_model.dart';

class InitialDataEntryUseCase extends UseCase {
  InitialDataEntryUseCase();

  @override
  Future call({params}) async {
    // Don't make it const
    String value = "";
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
            "value": value,
          },
          {
            "title": "Prasad Prep / Serving / Inventory maintenance",
            "value": value,
          },
          {
            "title": "Fund Raising",
            "value": value,
          },
          {
            "title": "Front Desk",
            "value": value,
          },
          {
            "title": "Social Media Assistance",
            "value": value,
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
            return "Lastname is required";
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
              r'^\+?\d{1,3}[-.\s]?\(?\d{1,4}\)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{0,4}$');

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
