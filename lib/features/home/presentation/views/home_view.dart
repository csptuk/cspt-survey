import 'package:csspt_app/constants.dart';
import 'package:csspt_app/features/data_entry/presentation/views/data_entry_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Text(
                              "Chelmsford Sri Srinivasa Perumal Temple",
                              style: kButtonTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: kBodyBackgroundColor,
          body: DataEntryView(),
        );
      },
    );
  }
}
