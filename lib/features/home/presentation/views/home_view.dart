import 'package:csspt_app/constants.dart';
import 'package:csspt_app/custom_checkbox_list_tile.dart';
import 'package:csspt_app/custom_container.dart';
import 'package:csspt_app/custom_elevated_button.dart';
import 'package:csspt_app/custom_radio_button.dart';
import 'package:csspt_app/custom_text_field.dart';
import 'package:csspt_app/features/home/data/models/devotee_model.dart';
import 'package:csspt_app/features/home/data/models/state_data_model.dart';
import 'package:csspt_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:csspt_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeBloc _homeBloc = sl.get<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: _homeBloc,
      listenWhen: (prev, next) => next is HomeActionState,
      buildWhen: (prev, next) => next is! HomeActionState,
      listener: _blocListener,
      builder: _blocBuilder,
    );
  }

  void _blocListener(BuildContext context, HomeState state) {
    debugPrint("listen: Home ${state.runtimeType}");

    switch (state.runtimeType) {
      default:
        return;
    }
  }

  Widget _blocBuilder(BuildContext context, HomeState state) {
    debugPrint("build: Home ${state.runtimeType}");

    switch (state.runtimeType) {
      case const (HomeLoadingState):
        return _buildLoadingView();

      case const (HomeDataEntryState):
        final StateDataModel stateData = state.stateData!;

        return _buildDataEntryView(stateData);

      case const (HomeDataSubmittedState):
        return _buildDataSubmittedView();

      case const (HomeErrorState):
        return _buildErrorView();

      default:
        return Container();
    }
  }

  Widget _buildLoadingView() {
    _homeBloc.add(const LoadedEvent());

    return const Center(
      child: SizedBox(
        width: 250,
        child: LinearProgressIndicator(
          color: kLoadingLineColor,
        ),
      ),
    );
  }

  Widget _buildDataEntryView(StateDataModel stateData) {
    DevoteeModel data = stateData.data!;

    void textFieldFocusChangeHelper(String key, String value) {
      _homeBloc.add(TextFieldFocusChangeEvent(
        key: key,
        value: value,
        stateData: stateData,
      ));
    }

    void radioButtonToggleHelper(String key, String value) {
      _homeBloc.add(RadioButtonToggledEvent(
        key: key,
        value: value,
        stateData: stateData,
      ));
    }

    void checkboxToggleHelper(String key, bool value) {
      _homeBloc.add(CheckboxSelectedEvent(
        key: key,
        value: value,
        stateData: stateData,
      ));
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(
              constraints.maxWidth,
              60.0,
            ),
            child: Material(
              elevation: 7,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: kAppBarBackgroundColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(
                            "Chelmsford Sri Srinivasa Perumal Temple",
                            style: kButtonTextStyle,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_rounded),
                    )
                  ],
                ),
              ),
            ),
          ),
          // AppBar(
          //   elevation: 7,
          //   scrolledUnderElevation: 7,
          //   centerTitle: true,
          //   title: Text(
          //     "Chelmsford Sri Srinivasa Perumal Temple",
          //     style: kButtonTextStyle,
          //   ),
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.only(
          //       bottomLeft: Radius.circular(10),
          //       bottomRight: Radius.circular(10),
          //     ),
          //   ),
          // ),
          backgroundColor: kBodyBackgroundColor,
          body: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("asserts/cspt_logo.png"),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: constraints.maxWidth / 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
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
                                    text: data.firstName,
                                  ),
                                  onFocusChange: (value) {
                                    textFieldFocusChangeHelper(
                                        "first_name", value);
                                  },
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
                                    text: data.lastName,
                                  ),
                                  onFocusChange: (value) {
                                    textFieldFocusChangeHelper(
                                        "last_name", value);
                                  },
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
                                    text: data.email,
                                  ),
                                  inputType: TextInputType.emailAddress,
                                  onFocusChange: (value) {
                                    textFieldFocusChangeHelper("email", value);
                                  },
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
                                    text: data.mobileNumber,
                                  ),
                                  inputType: TextInputType.phone,
                                  onFocusChange: (value) {
                                    textFieldFocusChangeHelper(
                                        "mobile_number", value);
                                  },
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
                                  groupValue: data.inGroup!,
                                  onChanged: (value) {
                                    radioButtonToggleHelper(
                                        "in_group", value ?? "");
                                  },
                                ),
                                CustomRadioButton(
                                  value: "no",
                                  label: "No",
                                  groupValue: data.inGroup!,
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
                          if (data.inGroup! == "no")
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
                                        groupValue: data.joinGroup!,
                                        onChanged: (value) {
                                          radioButtonToggleHelper(
                                              "join_group", value ?? "");
                                        },
                                      ),
                                      CustomRadioButton(
                                        value: "no",
                                        label: "No",
                                        groupValue: data.joinGroup!,
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
                          if (data.inGroup! == "no")
                            const SizedBox(
                              height: 20.0,
                            ),
                          Animate(
                            effects: [
                              if (data.inGroup! == "no")
                                const SlideEffect(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                ),
                              if (data.inGroup! != "no")
                                const SlideEffect(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.decelerate,
                                  begin: Offset(0, 1),
                                ),
                            ],
                            child: CustomContainer(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    groupValue: data.picturesForSocialMedia!,
                                    onChanged: (value) {
                                      radioButtonToggleHelper(
                                          "pictures_for_social_media",
                                          value ?? "");
                                    },
                                  ),
                                  CustomRadioButton(
                                    value: "no",
                                    label: "No",
                                    groupValue: data.picturesForSocialMedia!,
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
                              if (data.inGroup! != "no")
                                const SlideEffect(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.decelerate,
                                  begin: Offset(0, 1),
                                ),
                            ],
                            child: CustomContainer(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    groupValue: data.volunteering!,
                                    onChanged: (value) {
                                      radioButtonToggleHelper(
                                          "volunteering", value ?? "");
                                    },
                                  ),
                                  CustomRadioButton(
                                    value: "no",
                                    label: "No",
                                    groupValue: data.volunteering!,
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
                          if (data.volunteering! == "yes")
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
                                            data.volunteeringService!.length,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return CustomCheckboxListTile(
                                            title:
                                                data.volunteeringService![index]
                                                    ["title"],
                                            value:
                                                data.volunteeringService![index]
                                                    ["value"],
                                            onChanged: (value) {
                                              checkboxToggleHelper(
                                                  data.volunteeringService![
                                                      index]["title"],
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
                          if (data.volunteering! == "yes")
                            const SizedBox(
                              height: 20.0,
                            ),
                          Animate(
                            effects: [
                              if (data.inGroup! == "no" ||
                                  data.volunteering! == "yes")
                                const SlideEffect(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                ),
                              if (data.inGroup! != "no" ||
                                  data.volunteering! != "yes")
                                const SlideEffect(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.decelerate,
                                  begin: Offset(0, 1),
                                ),
                            ],
                            child: Align(
                              alignment: Alignment.center,
                              child: CustomElevatedButton(
                                text: "Submit",
                                onPressed: () {},
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDataSubmittedView() {
    return const Center(
      child: Text('Error'),
    );
  }

  Widget _buildErrorView() {
    return const Center(
      child: Text('Error'),
    );
  }

//
// Uuid uuid = const Uuid();
//
// TextEditingController firstNameController = TextEditingController();
// TextEditingController lastNameController = TextEditingController();
// TextEditingController emailController = TextEditingController();
// TextEditingController mobileController = TextEditingController();
//
// String inGroup = "";
// String joinGroup = "";
// String picturesForSocialMedia = "";
// String volunteering = "";
//
// List<Map<String, dynamic>> volunteeringService = [
//   {"title": "Prepare and Organising Events", "value": false},
//   {"title": "Prasad Prep/Serving/Inventory maintenance", "value": false},
//   {"title": "Fund Raising", "value": false},
//   {"title": "Front Desk", "value": false},
//   {"title": "Social Media Assistance", "value": false},
// ];
//
// void onSubmit() async {
//   if (firstNameController.text.trim().isEmpty) {}
//   if (lastNameController.text.trim().isEmpty) {}
//   if (emailController.text.trim().isEmpty &&
//       emailController.text.contains("@")) {}
//   if (mobileController.text.trim().isEmpty) {}
//
//   DevoteeDataModel model = DevoteeDataModel(
//     date: DateTime.now(),
//     id: uuid.v4(),
//     firstName: firstNameController.text.trim(),
//     lastName: lastNameController.text.trim(),
//     email: emailController.text.trim(),
//     mobileNumber: mobileController.text.trim(),
//     inGroup: inGroup,
//     joinGroup: joinGroup,
//     picturesForSocialMedia: picturesForSocialMedia,
//     volunteering: volunteering,
//     volunteeringService: volunteeringService,
//   );
//
//   Box<DevoteeDataModel> box =
//       await Hive.openBox<DevoteeDataModel>("devotee_box");
//
//   await box.add(model);
//   print(box.getAt(box.length - 1));
//   await box.close();
// }
//
// @override
// Widget build(BuildContext context) {
//   return LayoutBuilder(
//     builder: (BuildContext context, BoxConstraints constraints) {
//       return Scaffold(
//         appBar: PreferredSize(
//           preferredSize: Size(
//             constraints.maxWidth,
//             60.0,
//           ),
//           child: Material(
//             elevation: 7,
//             borderRadius: const BorderRadius.only(
//               bottomLeft: Radius.circular(10),
//               bottomRight: Radius.circular(10),
//             ),
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: kAppBarBackgroundColor,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(10),
//                   bottomRight: Radius.circular(10),
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 30.0),
//                         child: Text(
//                           "Chelmsford Sri Srinivasa Perumal Temple",
//                           style: kButtonTextStyle,
//                         ),
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(Icons.more_vert_rounded),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//         // AppBar(
//         //   elevation: 7,
//         //   scrolledUnderElevation: 7,
//         //   centerTitle: true,
//         //   title: Text(
//         //     "Chelmsford Sri Srinivasa Perumal Temple",
//         //     style: kButtonTextStyle,
//         //   ),
//         //   shape: RoundedRectangleBorder(
//         //     borderRadius: BorderRadius.only(
//         //       bottomLeft: Radius.circular(10),
//         //       bottomRight: Radius.circular(10),
//         //     ),
//         //   ),
//         // ),
//         backgroundColor: kBodyBackgroundColor,
//         body: GestureDetector(
//           onTap: () {
//             FocusManager.instance.primaryFocus?.unfocus();
//           },
//           child: Row(
//             // mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: Container(
//                     decoration: const BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage("asserts/cspt_logo.png"),
//                         fit: BoxFit.fitWidth,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: constraints.maxWidth / 2,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 0.0),
//                   child: SingleChildScrollView(
//                     physics: const BouncingScrollPhysics(),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(
//                           height: 20.0,
//                         ),
//                         CustomContainer(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     "First Name",
//                                     style: kLabelTextStyle,
//                                   ),
//                                 ],
//                               ),
//                               CustomTextField(
//                                   controller: firstNameController),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20.0,
//                         ),
//                         CustomContainer(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     "Last Name",
//                                     style: kLabelTextStyle,
//                                   ),
//                                 ],
//                               ),
//                               CustomTextField(controller: lastNameController),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20.0,
//                         ),
//                         CustomContainer(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     "Email",
//                                     style: kLabelTextStyle,
//                                   ),
//                                 ],
//                               ),
//                               CustomTextField(
//                                 controller: emailController,
//                                 inputType: TextInputType.emailAddress,
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20.0,
//                         ),
//                         CustomContainer(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     "Mobile No",
//                                     style: kLabelTextStyle,
//                                   ),
//                                 ],
//                               ),
//                               CustomTextField(
//                                 controller: mobileController,
//                                 inputType: TextInputType.phone,
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20.0,
//                         ),
//                         CustomContainer(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     "Are you in our temple WhatsApp group ?",
//                                     style: kLabelTextStyle,
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               CustomRadioButton(
//                                 value: "yes",
//                                 label: "Yes",
//                                 groupValue: inGroup,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     inGroup = value ?? "";
//                                   });
//                                 },
//                               ),
//                               CustomRadioButton(
//                                 value: "no",
//                                 label: "No",
//                                 groupValue: inGroup,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     inGroup = value ?? "";
//                                   });
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20.0,
//                         ),
//                         if (inGroup == "no")
//                           Animate(
//                             effects: const [
//                               SlideEffect(
//                                 delay: Duration(milliseconds: 10),
//                                 duration: Duration(milliseconds: 500),
//                                 curve: Curves.decelerate,
//                                 begin: Offset(1, 0),
//                               ),
//                             ],
//                             child: CustomContainer(
//                               child: Animate(
//                                 effects: const [
//                                   FadeEffect(
//                                     duration: Duration(milliseconds: 300),
//                                     curve: Curves.easeIn,
//                                   ),
//                                 ],
//                                 child: Column(
//                                   crossAxisAlignment:
//                                       CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Text(
//                                           "Are you interested in joining our WhatsApp group ?",
//                                           style: kLabelTextStyle,
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     CustomRadioButton(
//                                       value: "yes",
//                                       label: "Yes",
//                                       groupValue: joinGroup,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           joinGroup = value ?? "";
//                                         });
//                                       },
//                                     ),
//                                     CustomRadioButton(
//                                       value: "no",
//                                       label: "No",
//                                       groupValue: joinGroup,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           joinGroup = value ?? "";
//                                         });
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         if (inGroup == "no")
//                           const SizedBox(
//                             height: 20.0,
//                           ),
//                         Animate(
//                           effects: [
//                             if (inGroup == "no")
//                               const SlideEffect(
//                                 duration: Duration(milliseconds: 300),
//                                 curve: Curves.fastLinearToSlowEaseIn,
//                               ),
//                             if (inGroup != "no")
//                               const SlideEffect(
//                                 duration: Duration(milliseconds: 500),
//                                 curve: Curves.decelerate,
//                                 begin: Offset(0, 1),
//                               ),
//                           ],
//                           child: CustomContainer(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Text(
//                                       "Do you consent for taking photos & publishing on social media ?",
//                                       style: kLabelTextStyle,
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 CustomRadioButton(
//                                   value: "yes",
//                                   label: "Yes",
//                                   groupValue: picturesForSocialMedia,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       picturesForSocialMedia = value ?? "";
//                                     });
//                                   },
//                                 ),
//                                 CustomRadioButton(
//                                   value: "no",
//                                   label: "No",
//                                   groupValue: picturesForSocialMedia,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       picturesForSocialMedia = value ?? "";
//                                     });
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20.0,
//                         ),
//                         Animate(
//                           effects: [
//                             if (inGroup != "no")
//                               const SlideEffect(
//                                 duration: Duration(milliseconds: 500),
//                                 curve: Curves.decelerate,
//                                 begin: Offset(0, 1),
//                               ),
//                           ],
//                           child: CustomContainer(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Text(
//                                       "Are you interested in volunteering ?",
//                                       style: kLabelTextStyle,
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 CustomRadioButton(
//                                   value: "yes",
//                                   label: "Yes",
//                                   groupValue: volunteering,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       volunteering = value ?? "";
//                                     });
//                                   },
//                                 ),
//                                 CustomRadioButton(
//                                   value: "no",
//                                   label: "No",
//                                   groupValue: volunteering,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       volunteering = value ?? "";
//                                     });
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20.0,
//                         ),
//                         if (volunteering == "yes")
//                           Animate(
//                             effects: const [
//                               SlideEffect(
//                                 delay: Duration(milliseconds: 10),
//                                 duration: Duration(milliseconds: 500),
//                                 curve: Curves.decelerate,
//                                 begin: Offset(1, 0),
//                               ),
//                             ],
//                             child: CustomContainer(
//                               child: Animate(
//                                 effects: const [
//                                   FadeEffect(
//                                     duration: Duration(milliseconds: 300),
//                                     curve: Curves.easeIn,
//                                   ),
//                                 ],
//                                 child: Column(
//                                   crossAxisAlignment:
//                                       CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Text(
//                                           "See how your time and talents can make a difference at the temple",
//                                           style: kLabelTextStyle,
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     ListView.builder(
//                                       itemCount: volunteeringService.length,
//                                       shrinkWrap: true,
//                                       physics:
//                                           const NeverScrollableScrollPhysics(),
//                                       itemBuilder:
//                                           (BuildContext context, int index) {
//                                         return CustomCheckboxListTile(
//                                           title: volunteeringService[index]
//                                               ["title"],
//                                           value: volunteeringService[index]
//                                               ["value"],
//                                           onChanged: (value) {
//                                             setState(() {
//                                               volunteeringService[index]
//                                                   ["value"] = value;
//                                             });
//                                           },
//                                         );
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         if (volunteering == "yes")
//                           const SizedBox(
//                             height: 20.0,
//                           ),
//                         Animate(
//                           effects: [
//                             if (inGroup == "no" || volunteering == "yes")
//                               const SlideEffect(
//                                 duration: Duration(milliseconds: 300),
//                                 curve: Curves.fastLinearToSlowEaseIn,
//                               ),
//                             if (inGroup != "no" || volunteering != "yes")
//                               const SlideEffect(
//                                 duration: Duration(milliseconds: 500),
//                                 curve: Curves.decelerate,
//                                 begin: Offset(0, 1),
//                               ),
//                           ],
//                           child: Align(
//                             alignment: Alignment.center,
//                             child: CustomElevatedButton(
//                               text: "Submit",
//                               onPressed: onSubmit,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20.0,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
}
