import 'package:csspt_app/constants.dart';
import 'package:csspt_app/custom_checkbox_list_tile.dart';
import 'package:csspt_app/custom_container.dart';
import 'package:csspt_app/custom_elevated_button.dart';
import 'package:csspt_app/custom_radio_button.dart';
import 'package:csspt_app/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  String inGroup = "";
  String joinGroup = "";
  String picturesForSocialMedia = "";
  String volunteering = "";

  List<Map<String, dynamic>> volunteeringService = [
    {"title": "Prepare and Organising Events", "value": false},
    {"title": "Prasad Prep/Serving/Inventory maintenance", "value": false},
    {"title": "Fund Raising", "value": false},
    {"title": "Front Desk", "value": false},
    {"title": "Social Media Assistance", "value": false},
  ];

  void onSubmit() {

  }


  @override
  Widget build(BuildContext context) {
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
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              child: Container(
                decoration: BoxDecoration(
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
                      icon: Icon(Icons.more_vert_rounded),
                    )
                  ],
                ),
              ),
            ),
          ),
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
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
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
                                    controller: firstNameController),
                              ],
                            ),
                          ),
                          SizedBox(
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
                                CustomTextField(controller: lastNameController),
                              ],
                            ),
                          ),
                          SizedBox(
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
                                  controller: emailController,
                                  inputType: TextInputType.emailAddress,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
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
                                  controller: mobileController,
                                  inputType: TextInputType.phone,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
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
                                SizedBox(
                                  height: 10,
                                ),
                                CustomRadioButton(
                                  value: "yes",
                                  label: "Yes",
                                  groupValue: inGroup,
                                  onChanged: (value) {
                                    setState(() {
                                      inGroup = value ?? "";
                                    });
                                  },
                                ),
                                CustomRadioButton(
                                  value: "no",
                                  label: "No",
                                  groupValue: inGroup,
                                  onChanged: (value) {
                                    setState(() {
                                      inGroup = value ?? "";
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          if (inGroup == "no")
                            Animate(
                              effects: [
                                SlideEffect(
                                  delay: Duration(milliseconds: 10),
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.decelerate,
                                  begin: Offset(1, 0),
                                ),
                              ],
                              child: CustomContainer(
                                child: Animate(
                                  effects: [
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
                                      SizedBox(
                                        height: 10,
                                      ),
                                      CustomRadioButton(
                                        value: "yes",
                                        label: "Yes",
                                        groupValue: joinGroup,
                                        onChanged: (value) {
                                          setState(() {
                                            joinGroup = value ?? "";
                                          });
                                        },
                                      ),
                                      CustomRadioButton(
                                        value: "no",
                                        label: "No",
                                        groupValue: joinGroup,
                                        onChanged: (value) {
                                          setState(() {
                                            joinGroup = value ?? "";
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if (inGroup == "no")
                            SizedBox(
                              height: 20.0,
                            ),
                          Animate(
                            effects: [
                              if (inGroup == "no")
                                SlideEffect(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                ),
                              if (inGroup != "no")
                                SlideEffect(
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
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomRadioButton(
                                    value: "yes",
                                    label: "Yes",
                                    groupValue: picturesForSocialMedia,
                                    onChanged: (value) {
                                      setState(() {
                                        picturesForSocialMedia = value ?? "";
                                      });
                                    },
                                  ),
                                  CustomRadioButton(
                                    value: "no",
                                    label: "No",
                                    groupValue: picturesForSocialMedia,
                                    onChanged: (value) {
                                      setState(() {
                                        picturesForSocialMedia = value ?? "";
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Animate(
                            effects: [
                              if (inGroup != "no")
                                SlideEffect(
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
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomRadioButton(
                                    value: "yes",
                                    label: "Yes",
                                    groupValue: volunteering,
                                    onChanged: (value) {
                                      setState(() {
                                        volunteering = value ?? "";
                                      });
                                    },
                                  ),
                                  CustomRadioButton(
                                    value: "no",
                                    label: "No",
                                    groupValue: volunteering,
                                    onChanged: (value) {
                                      setState(() {
                                        volunteering = value ?? "";
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          if (volunteering == "yes")
                            Animate(
                              effects: [
                                SlideEffect(
                                  delay: Duration(milliseconds: 10),
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.decelerate,
                                  begin: Offset(1, 0),
                                ),
                              ],
                              child: CustomContainer(
                                child: Animate(
                                  effects: [
                                    FadeEffect(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeIn,
                                    ),
                                  ],
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            Text(
                                              "See how your time and talents can make a difference at the temple",
                                              style: kLabelTextStyle,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ListView.builder(
                                        itemCount: volunteeringService.length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return CustomCheckboxListTile(
                                            title: volunteeringService[index]
                                                ["title"],
                                            value: volunteeringService[index]
                                                ["value"],
                                            onChanged: (value) {
                                              setState(() {
                                                volunteeringService[index]
                                                    ["value"] = value;
                                              });
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if (volunteering == "yes")
                            SizedBox(
                              height: 20.0,
                            ),
                          Animate(
                            effects: [
                              if (inGroup == "no" || volunteering == "yes")
                                SlideEffect(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                ),
                              if (inGroup != "no" || volunteering != "yes")
                                SlideEffect(
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
                          SizedBox(
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
}
