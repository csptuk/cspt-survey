import 'package:csspt_app/constants.dart';
import 'package:csspt_app/features/data_entry/data/models/data_entry_state_data_model.dart';
import 'package:csspt_app/features/data_entry/presentation/bloc/data_entry_bloc.dart';
import 'package:csspt_app/features/data_entry/presentation/widgets/custom_checkbox_list_tile.dart';
import 'package:csspt_app/features/data_entry/presentation/widgets/custom_container.dart';
import 'package:csspt_app/features/data_entry/presentation/widgets/custom_elevated_button.dart';
import 'package:csspt_app/features/data_entry/presentation/widgets/custom_radio_button.dart';
import 'package:csspt_app/features/data_entry/presentation/widgets/custom_text_field.dart';
import 'package:csspt_app/features/data_entry/presentation/widgets/multi_touch_detector.dart';
import 'package:csspt_app/features/data_visualize/presentation/views/data_visualize_view.dart';
import 'package:csspt_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _formKey = GlobalKey<FormState>();

class DataEntryView extends StatelessWidget {
  DataEntryView({super.key});

  final DataEntryBloc _dataEntryBloc = sl.get<DataEntryBloc>();

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return BlocConsumer<DataEntryBloc, DataEntryState>(
      bloc: _dataEntryBloc,
      listenWhen: (prev, next) => next is DataEntryActionState,
      buildWhen: (prev, next) => next is! DataEntryActionState,
      listener: _blocListener,
      builder: _blocBuilder,
    );
  }

  void _blocListener(BuildContext context, DataEntryState state) {
    switch (state.runtimeType) {
      default:
        return;
    }
  }

  Widget _blocBuilder(BuildContext context, DataEntryState state) {
    switch (state.runtimeType) {
      case const (DataEntryLoadingState):
        return _buildLoadingView();

      case const (DataEntryLoadedState):
        final DataEntryStateDataModel stateData = state.stateData!;
        return _buildDataEntryView(stateData);

      case const (SwitchToDataVisualizeState):
        return DataVisualizeView();

      default:
        return Container();
    }
  }

  Widget _buildLoadingView() {
    _dataEntryBloc.add(const LoadedEvent());

    return const Center(
      child: SizedBox(
        width: 250,
        child: LinearProgressIndicator(
          color: kLoadingLineColor,
        ),
      ),
    );
  }

  Widget _buildDataEntryView(DataEntryStateDataModel stateData) {
    Map<String, dynamic> data = stateData.data!;

    void textFieldFocusChangeHelper(String key, String value) {
      _dataEntryBloc.add(TextFieldFocusChangeEvent(
        key: key,
        value: value,
        stateData: stateData,
      ));
    }

    void radioButtonToggleHelper(String key, String value) {
      _dataEntryBloc.add(RadioButtonToggledEvent(
        key: key,
        value: value,
        stateData: stateData,
      ));
    }

    void checkboxToggleHelper(String key, bool value) {
      _dataEntryBloc.add(CheckboxSelectedEvent(
        key: key,
        value: value,
        stateData: stateData,
      ));
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: MultiTouchDetector(
                    oneTouch: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    afterTouches: () {
                      _dataEntryBloc.add(SwitchToDataVisualizeEvent());
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/cspt_logo.png"),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: constraints.maxWidth / 2,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: !stateData.submitted!
                      ? Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20.0,
                              ),
                              CustomContainer(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "First Name",
                                          style: kLabelTextStyle,
                                        ),
                                      ],
                                    ),
                                    CustomTextField(
                                      controller: TextEditingController(
                                        text: data["first_name"],
                                      ),
                                      focusNode: FocusNode(debugLabel: "1"),
                                      onFocusChange: (value) {
                                        textFieldFocusChangeHelper(
                                            "first_name", value);
                                      },
                                      validator: stateData
                                          .validators!.firstNameValidator,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              CustomContainer(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Last Name",
                                          style: kLabelTextStyle,
                                        ),
                                      ],
                                    ),
                                    CustomTextField(
                                      controller: TextEditingController(
                                        text: data["last_name"],
                                      ),
                                      focusNode: FocusNode(debugLabel: "2"),
                                      onFocusChange: (value) {
                                        textFieldFocusChangeHelper(
                                            "last_name", value);
                                      },
                                      validator: stateData
                                          .validators!.lastNameValidator,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              CustomContainer(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Email",
                                          style: kLabelTextStyle,
                                        ),
                                      ],
                                    ),
                                    CustomTextField(
                                      controller: TextEditingController(
                                        text: data["email"],
                                      ),
                                      focusNode: FocusNode(debugLabel: "3"),
                                      inputType: TextInputType.emailAddress,
                                      onFocusChange: (value) {
                                        textFieldFocusChangeHelper(
                                            "email", value);
                                      },
                                      validator:
                                          stateData.validators!.emailValidator,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              CustomContainer(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Mobile No",
                                          style: kLabelTextStyle,
                                        ),
                                      ],
                                    ),
                                    CustomTextField(
                                      controller: TextEditingController(
                                        text: data["mobile_number"],
                                      ),
                                      focusNode: FocusNode(debugLabel: "4"),
                                      inputType: TextInputType.phone,
                                      onFocusChange: (value) {
                                        textFieldFocusChangeHelper(
                                            "mobile_number", value);
                                      },
                                      validator: stateData
                                          .validators!.mobileNumberValidator,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              CustomContainer(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Are you in our temple WhatsApp group ?",
                                          style: kLabelTextStyle,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomRadioButton(
                                      value: "yes",
                                      label: "Yes",
                                      groupValue: data["in_group"],
                                      onChanged: (value) {
                                        radioButtonToggleHelper(
                                            "in_group", value ?? "");
                                      },
                                    ),
                                    CustomRadioButton(
                                      value: "no",
                                      label: "No",
                                      groupValue: data["in_group"],
                                      onChanged: (value) {
                                        radioButtonToggleHelper(
                                            "in_group", value ?? "");
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              if (data["in_group"] == "no")
                                Animate(
                                  effects: const [
                                    SlideEffect(
                                      delay: Duration(milliseconds: 10),
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.decelerate,
                                      begin: Offset(1, 0),
                                    ),
                                  ],
                                  child: CustomContainer(
                                    child: Animate(
                                      effects: const [
                                        FadeEffect(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.easeIn,
                                        ),
                                      ],
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Are you interested in joining our WhatsApp group ?",
                                                style: kLabelTextStyle,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CustomRadioButton(
                                            value: "yes",
                                            label: "Yes",
                                            groupValue: data["join_group"],
                                            onChanged: (value) {
                                              radioButtonToggleHelper(
                                                  "join_group", value ?? "");
                                            },
                                          ),
                                          CustomRadioButton(
                                            value: "no",
                                            label: "No",
                                            groupValue: data["join_group"],
                                            onChanged: (value) {
                                              radioButtonToggleHelper(
                                                  "join_group", value ?? "");
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              if (data["in_group"] == "no")
                                const SizedBox(
                                  height: 20.0,
                                ),
                              Animate(
                                effects: [
                                  if (data["in_group"] == "no")
                                    const SlideEffect(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                    ),
                                  if (data["in_group"] != "no")
                                    const SlideEffect(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.decelerate,
                                      begin: Offset(0, 1),
                                    ),
                                ],
                                child: CustomContainer(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Do you consent for taking photos & publishing on social media ?",
                                            style: kLabelTextStyle,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomRadioButton(
                                        value: "yes",
                                        label: "Yes",
                                        groupValue:
                                            data["pictures_for_social_media"],
                                        onChanged: (value) {
                                          radioButtonToggleHelper(
                                              "pictures_for_social_media",
                                              value ?? "");
                                        },
                                      ),
                                      CustomRadioButton(
                                        value: "no",
                                        label: "No",
                                        groupValue:
                                            data["pictures_for_social_media"],
                                        onChanged: (value) {
                                          radioButtonToggleHelper(
                                              "pictures_for_social_media",
                                              value ?? "");
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Animate(
                                effects: [
                                  if (data["in_group"] != "no")
                                    const SlideEffect(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.decelerate,
                                      begin: Offset(0, 1),
                                    ),
                                ],
                                child: CustomContainer(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Are you interested in volunteering ?",
                                            style: kLabelTextStyle,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomRadioButton(
                                        value: "yes",
                                        label: "Yes",
                                        groupValue: data["volunteering"],
                                        onChanged: (value) {
                                          radioButtonToggleHelper(
                                              "volunteering", value ?? "");
                                        },
                                      ),
                                      CustomRadioButton(
                                        value: "no",
                                        label: "No",
                                        groupValue: data["volunteering"],
                                        onChanged: (value) {
                                          radioButtonToggleHelper(
                                              "volunteering", value ?? "");
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              if (data["volunteering"] == "yes")
                                Animate(
                                  effects: const [
                                    SlideEffect(
                                      delay: Duration(milliseconds: 10),
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.decelerate,
                                      begin: Offset(1, 0),
                                    ),
                                  ],
                                  child: CustomContainer(
                                    child: Animate(
                                      effects: const [
                                        FadeEffect(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.easeIn,
                                        ),
                                      ],
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "See how your time and talents can make a difference at the temple",
                                                style: kLabelTextStyle,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          ListView.builder(
                                            itemCount:
                                                data["volunteering_service"]
                                                    .length,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CustomCheckboxListTile(
                                                title:
                                                    data["volunteering_service"]
                                                        [index]["title"],
                                                value:
                                                    data["volunteering_service"]
                                                            [index]["value"] ==
                                                        "Yes",
                                                onChanged: (value) {
                                                  checkboxToggleHelper(
                                                      data["volunteering_service"]
                                                          [index]["title"],
                                                      value!);
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              if (data["volunteering"] == "yes")
                                const SizedBox(
                                  height: 20.0,
                                ),
                              Animate(
                                // key: UniqueKey(),
                                effects: [
                                  if (!stateData.validationFailed!)
                                    if (data["in_group"] == "no" ||
                                        data["volunteering"] == "yes")
                                      const SlideEffect(
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.fastLinearToSlowEaseIn,
                                      ),
                                  if (!stateData.validationFailed!)
                                    if (data["in_group"] != "no" ||
                                        data["volunteering"] != "yes")
                                      const SlideEffect(
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.decelerate,
                                        begin: Offset(0, 1),
                                      ),
                                  if (stateData.validationFailed!)
                                    const ShakeEffect(
                                      duration: Duration(milliseconds: 200),
                                      curve: Curves.decelerate,
                                    )
                                ],
                                child: Align(
                                  alignment: Alignment.center,
                                  child: CustomElevatedButton(
                                    text: "Submit",
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _dataEntryBloc.add(FormSubmittedEvent(
                                            stateData: stateData));
                                      } else {
                                        _dataEntryBloc.add(
                                            ValidationFailedEvent(
                                                stateData: stateData));
                                      }
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 80,
                              child: CustomContainer(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Submitted Successfully!",
                                      style: kButtonTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: CustomElevatedButton(
                                text: "Click to Check-in",
                                onPressed: () {
                                  _dataEntryBloc.add(ResetFormEvent());
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
