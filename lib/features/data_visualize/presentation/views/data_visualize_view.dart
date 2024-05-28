import 'package:csspt_app/constants.dart';
import 'package:csspt_app/features/data_entry/presentation/views/data_entry_view.dart';
import 'package:csspt_app/features/data_visualize/data/models/data_visualize_column_model.dart';
import 'package:csspt_app/features/data_visualize/data/models/data_visualize_state_data_model.dart';
import 'package:csspt_app/features/data_visualize/presentation/bloc/data_visualize_bloc.dart';
import 'package:csspt_app/helper/string_casting_extension.dart';
import 'package:csspt_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

class DataVisualizeView extends StatelessWidget {
  DataVisualizeView({super.key});

  final DataVisualizeBloc _dataVisualizeBloc = sl.get<DataVisualizeBloc>();

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return BlocConsumer<DataVisualizeBloc, DataVisualizeState>(
      bloc: _dataVisualizeBloc,
      listenWhen: (prev, next) => next is DataVisualizeActionState,
      buildWhen: (prev, next) => next is! DataVisualizeActionState,
      listener: _blocListener,
      builder: _blocBuilder,
    );
  }

  void _blocListener(BuildContext context, DataVisualizeState state) {
    debugPrint("listen: DataVisualize ${state.runtimeType}");

    switch (state.runtimeType) {
      default:
        return;
    }
  }

  Widget _blocBuilder(BuildContext context, DataVisualizeState state) {
    debugPrint("build : DataVisualize ${state.runtimeType}");

    switch (state.runtimeType) {
      case const (DataVisualizeLoadingState):
        return _buildLoadingView();

      case const (DataVisualizeLoadedState):
        final DataVisualizeStateDataModel stateData = state.stateData!;
        return _buildDataEntryView(stateData);

      case const (SwitchToDataEntryState):
        return DataEntryView();

      default:
        return Container();
    }
  }

  Widget _buildLoadingView() {
    _dataVisualizeBloc.add(const LoadedEvent());

    return const Center(
      child: SizedBox(
        width: 250,
        child: LinearProgressIndicator(
          color: kLoadingLineColor,
        ),
      ),
    );
  }

  Widget _buildDataEntryView(DataVisualizeStateDataModel stateData) {
    List<DataVisualizeColumnModel> columns = stateData.columns!;
    List<Map<String, dynamic>> data = stateData.data!;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.all(40.0),
          child: Container(
            decoration: BoxDecoration(
              color: kAppBarBackgroundColor,
              borderRadius: kBorderRadius,
              boxShadow: kBoxShadowList,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: kBorderRadius,
                      boxShadow: kBoxShadowList,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                            ),
                            onPressed: () {
                              _dataVisualizeBloc
                                  .add(const BackToDataEntryEvent());
                            },
                            child: Text(
                              "< Back To Form",
                              style: kLabelTextStyle,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Upload Data",
                                  style: kLabelTextStyle,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Export Cloud Data",
                                  style: kLabelTextStyle,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Export Local Data",
                                  style: kLabelTextStyle,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: kBorderRadius,
                        boxShadow: kBoxShadowList,
                        border: Border.all(width: 1),
                      ),
                      child: ClipRRect(
                        borderRadius: kBorderRadius,
                        child: TableView(
                          horizontalDetails: const ScrollableDetails.horizontal(
                            physics: ClampingScrollPhysics(),
                          ),
                          delegate: TableCellBuilderDelegate(
                            columnCount: columns.length,
                            rowCount: data.length + 1,
                            pinnedRowCount: 1,
                            columnBuilder: (int index) {
                              return const TableSpan(
                                backgroundDecoration: TableSpanDecoration(
                                  border: TableSpanBorder(
                                    leading: BorderSide(
                                      color: Colors.black54,
                                    ),
                                    trailing: BorderSide(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                                extent: FixedTableSpanExtent(231),
                              );
                            },
                            rowBuilder: (int index) {
                              return const TableSpan(
                                backgroundDecoration: TableSpanDecoration(
                                  border: TableSpanBorder(
                                    leading: BorderSide(
                                      color: Colors.black54,
                                    ),
                                    trailing: BorderSide(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                                extent: FixedTableSpanExtent(35),
                              );
                            },
                            cellBuilder:
                                (BuildContext context, TableVicinity vicinity) {
                              if (vicinity.row == 0) {
                                String field =
                                    columns[vicinity.column].title.toString();

                                return TableViewCell(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SelectableText(
                                          field.toTitleCase(),
                                          style: GoogleFonts.lato(
                                            textStyle: const TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                              if (vicinity.column == 0) {
                                return TableViewCell(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          if (data[vicinity.row - 1]
                                                  ["edit_state"] ==
                                              false) {
                                            _dataVisualizeBloc.add(
                                                EditDataEntryEvent(
                                                    key: data[vicinity.row - 1]
                                                        ["key"],
                                                    stateData: stateData));
                                          } else {
                                            _dataVisualizeBloc.add(
                                                SaveDataEntryEvent(
                                                    key: data[vicinity.row - 1]
                                                        ["key"],
                                                    stateData: stateData));
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: const Color(0xCCFFFF00),
                                            shape: BoxShape.circle,
                                            boxShadow: kBoxShadowList,
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: Icon(Icons
                                                .mode_edit_outline_outlined),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          _dataVisualizeBloc.add(
                                              DeleteDataEntryEvent(
                                                  key: data[vicinity.row - 1]
                                                      ["key"],
                                                  stateData: stateData));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: const Color(0x77FF0000),
                                            shape: BoxShape.circle,
                                            boxShadow: kBoxShadowList,
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(2.0),
                                            child: Icon(
                                                Icons.delete_forever_outlined),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                String text = (data[vicinity.row - 1]
                                            [columns[vicinity.column].value] ??
                                        "")
                                    .toString()
                                    .toTitleCase();

                                if (columns[vicinity.column].value == "date") {
                                  text = DateFormat('dd-MM-yyyy').format(
                                      DateTime.parse(text.toUpperCase()));
                                }
                                if (vicinity.column >= 10) {
                                  text = (data[vicinity.row - 1]
                                                  ["volunteering_service"][
                                              int.parse(columns[vicinity.column]
                                                  .value!)]["value"] ??
                                          "")
                                      .toString();
                                  text = text == "true" ? "Yes" : "";
                                }

                                if (vicinity.column == 1 ||
                                    data[vicinity.row - 1]["edit_state"] ==
                                        false) {
                                  return TableViewCell(
                                    child: Center(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: SelectableText(
                                          text,
                                          style: GoogleFonts.lato(),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return TableViewCell(
                                    child: Center(
                                      child: TextFormField(
                                        controller:
                                            TextEditingController(text: text),
                                        style: GoogleFonts.lato(),
                                        decoration: InputDecoration(),
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
