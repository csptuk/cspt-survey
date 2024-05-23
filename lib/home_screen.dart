import 'package:csspt_app/constants.dart';
import 'package:csspt_app/custom_container.dart';
import 'package:csspt_app/custom_radio_button.dart';
import 'package:csspt_app/custom_text_field.dart';
import 'package:flutter/material.dart';

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
              child: Container(
                color: kAppBarBackgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.more_vert_rounded))
                  ],
                ),
              ),
            ),
          ),
          backgroundColor: kBodyBackgroundColor,
          body: SizedBox(
            width: constraints.maxWidth / 2,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("First Name"),
                            ],
                          ),
                          CustomTextField(controller: firstNameController),
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
                              Text("Last Name"),
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
                              Text("Email"),
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
                              Text("Mobile Number"),
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
                              Text("Are you in our temple WhatsApp group ?"),
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
                    CustomContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                  "Are you intrested in joining our WhatsApp group ?"),
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
                                  "Do you consent for taking photos & publishing on social media ?"),
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
                    SizedBox(
                      height: 20.0,
                    ),
                    CustomContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Are you interested in volunteering ?"),
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
                                  "Choose volunteering services you would like to be involved in "),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
